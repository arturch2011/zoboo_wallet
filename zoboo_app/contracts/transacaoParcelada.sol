// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract transacaoParcelada {
    AggregatorV3Interface internal dataFeed;

    constructor() {
        dataFeed = AggregatorV3Interface(
            0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41
        );
    }

    struct swapTransaction {
        uint id;
        string ativo;
        string ativoObj;
        uint valor_ativo;
        uint valor_ativoObj;
        uint intrestRate;
        uint parcelas;
        uint valorParcela;
        uint valorTotal;
        address sender;
        address receiver;
    }

    struct transaction {
        uint id;
        string ativo;
        int256 valor_ativo;
        int256 parcelas;
        int256 valorParcela;
        int256 valorTotal;
        address sender;
        address receiver;
        uint frequency;
        bool accepted;
        bool finalized;
        uint256 valorEnviado;
    }

    swapTransaction[] public swapTransactions;
    transaction[] public transactions;
    mapping(address => uint[]) public userTransactions;
    mapping(address => uint[]) public myAcceptedTransactions;

    function createTransaction(
        string memory _ativo,
        int256 _parcelas,
        address _receiver,
        uint quantidade,
        uint _frequency
    ) public payable {
        require(
            msg.value == quantidade,
            "Quantidade de ether enviada deve ser igual ao passado para a funcao"
        );
        require(_parcelas > 0, "Parcelas deve ser maior que 0");
        (, int256 _valor_ativo, , , ) = dataFeed.latestRoundData();
        int256 _valorTotal = _valor_ativo * int256(msg.value);
        int256 _valorParcela = _valorTotal / _parcelas;

        userTransactions[msg.sender].push(transactions.length);
        transactions.push(
            transaction(
                transactions.length,
                _ativo,
                _valor_ativo,
                _parcelas,
                _valorParcela,
                _valorTotal,
                msg.sender,
                payable(_receiver),
                _frequency,
                false,
                false,
                msg.value
            )
        );
    }

    function acceptTransaction(uint _id) public {
        require(
            transactions[_id].receiver == msg.sender,
            "Somente o receiver pode aceitar a transacao"
        );
        myAcceptedTransactions[msg.sender].push(_id);
        transactions[_id].accepted = true;
    }

    function executeParcel(uint _id) public {
        require(transactions[_id].accepted == true, "Transacao nao foi aceita");
        require(transactions[_id].finalized == false);
        require(
            transactions[_id].parcelas > 0,
            "Todas as parcelas ja foram pagas"
        );
        (, int256 _valor_ativo, , , ) = dataFeed.latestRoundData();

        int256 valor_atual = _valor_ativo *
            int256(transactions[_id].valorEnviado);
        if (valor_atual < transactions[_id].valorTotal) {
            transactions[_id].finalized = true;
            payable(transactions[_id].receiver).transfer(
                transactions[_id].valorEnviado
            );
        } else {
            transactions[_id].parcelas -= 1;
            transactions[_id].valorTotal -= transactions[_id].valorParcela;
            payable(transactions[_id].receiver).transfer(
                uint256(transactions[_id].valorParcela)
            );
        }
    }

    function executeAutomation() public {
        for (uint i = 0; i < transactions.length; i++) {
            if (
                transactions[i].accepted == true &&
                transactions[i].finalized == false
            ) {
                executeParcel(i);
            }
        }
    }

    function getMyTransactions() public view returns (uint[] memory) {
        return userTransactions[msg.sender];
    }

    function getMyAcceptedTransactions() public view returns (uint[] memory) {
        return myAcceptedTransactions[msg.sender];
    }

    function getTransactions() public view returns (transaction[] memory) {
        return transactions;
    }
}
