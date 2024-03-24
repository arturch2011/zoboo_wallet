// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract transacaoParcelada {
    AggregatorV3Interface internal dataFeed;
    uint public fundedValue;
    uint public totalValue;
    uint public totalSponsors;
    uint public rate;
    address public owner;

    constructor(uint _rate) {
        dataFeed = AggregatorV3Interface(
            0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41
        );
        rate = _rate;
        owner = msg.sender;
    }

    struct transaction {
        uint id;
        int256 valor_ativo;
        int256 parcelas;
        int256 valorParcela;
        int256 valorTotal;
        address sender;
        bool finalized;
        uint256 valorEnviado;
        uint256 slipage;
        uint256 valMaisSlipage;
        int256 valorPago;
    }

    transaction[] public transactions;
    mapping(address => uint[]) public userTransactions;
    mapping(address => uint[]) public myAcceptedTransactions;
    mapping(address => uint256) public stakedEth;

    function createTransaction(
        int256 _parcelas,
        uint quantidade,
        uint256 _slipage
    ) public payable {
        require(
            msg.value == quantidade,
            "Quantidade de ether enviada deve ser igual ao passado para a funcao"
        );
        require(_parcelas > 0, "Parcelas deve ser maior que 0");
        (, int256 _valor_ativo, , , ) = dataFeed.latestRoundData();
        int256 _valorTotal = _valor_ativo * int256(msg.value);
        int256 _valorParcela = _valorTotal / _parcelas;
        uint valSlipage = (msg.value + _slipage) * (1 + rate);

        userTransactions[msg.sender].push(transactions.length);
        transactions.push(
            transaction(
                transactions.length,
                _valor_ativo,
                _parcelas,
                _valorParcela,
                _valorTotal,
                msg.sender,
                false,
                msg.value,
                _slipage,
                valSlipage,
                0
            )
        );
    }

    function executeParcel(uint _id) public {
        require(
            msg.sender == owner,
            "Somente o dono pode executar essa funcao"
        );
        require(transactions[_id].finalized == false);
        require(
            transactions[_id].parcelas > 0,
            "Todas as parcelas ja foram pagas"
        );
        (, int256 _valor_ativo, , , ) = dataFeed.latestRoundData();
        int256 valMaisSlipageAtual = int256(transactions[_id].valMaisSlipage) *
            (_valor_ativo);

        int256 valor_atual = _valor_ativo *
            int256(transactions[_id].valorEnviado);
        if (valor_atual < valMaisSlipageAtual) {
            transactions[_id].finalized = true;
        } else {
            transactions[_id].valorPago = ((int256(
                transactions[_id].valorEnviado
            ) - transactions[_id].valorPago) /
                int256(transactions[_id].parcelas));
            transactions[_id].parcelas -= 1;
        }
    }

    function executeAutomation() public {
        require(
            msg.sender == owner,
            "Somente o dono pode executar essa funcao"
        );
        for (uint i = 0; i < transactions.length; i++) {
            if (transactions[i].finalized == false) {
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

    function getTransaction(uint _id) public view returns (transaction memory) {
        return transactions[_id];
    }

    function stakeEth() public payable {
        stakedEth[msg.sender] += msg.value;
        totalSponsors += 1;
        totalValue += msg.value;
    }

    function myStakedEth() public view returns (uint256) {
        return stakedEth[msg.sender];
    }

    function withdrawStakedEth(uint256 _amount) public {
        require(
            stakedEth[msg.sender] >= _amount,
            "Voce nao tem ether suficiente staked"
        );
        if (stakedEth[msg.sender] == _amount) {
            totalSponsors -= 1;
        }

        stakedEth[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount * (1 + rate));
    }

    function withDrawExcedent(uint _id) public {
        require(
            msg.sender == transactions[_id].sender,
            "Somente o dono da transacao pode executar essa funcao"
        );
        require(
            transactions[_id].finalized == true,
            "Transacao ainda nao foi finalizada"
        );
        require(
            transactions[_id].valorTotal > 0,
            "Nao ha excedente a ser retirado"
        );
        uint256 excedent = uint256(transactions[_id].valorTotal);
        transactions[_id].valorTotal = 0;
        payable(msg.sender).transfer(excedent);
    }
}
