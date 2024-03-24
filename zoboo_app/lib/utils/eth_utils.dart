import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

// import 'package:provider/provider.dart';
// import 'package:goals_flutter/providers/user_info_provider.dart';

late String privKey;

getPrivKey(key) {
  privKey = key;
  return privKey;
}

var getPrivKeys = getPrivKey;

final ethUtilsProviders = StateNotifierProvider<EthereumUtils, bool>((ref) {
  return EthereumUtils();
});

class EthereumUtils extends StateNotifier<bool> {
  EthereumUtils() : super(true) {
    initialSetup();
  }

  // String address = UserProvider().userInfos[0]['privKey'];
  Web3Client? _ethClient;
  bool isLoading = true;
  String? _abi;
  String? _abiToken;
  EthereumAddress? _contractAddress;
  EthereumAddress? _contractAddressToken;
  Credentials? _credentials;
  DeployedContract? _contract;
  DeployedContract? _contractToken;
  EthereumAddress? address;

  // ContractFunction? _userName;
  // ContractFunction? _setName;

  ContractFunction? _createGoal;
  ContractFunction? _startGoal;
  ContractFunction? _enterGoal;
  ContractFunction? _updateFrequency;
  ContractFunction? _autenticateFrequency;
  ContractFunction? _completeGoal;
  ContractFunction? _getGoal;
  ContractFunction? _getMyProgress;
  ContractFunction? _getMyBets;
  ContractFunction? _participants;
  ContractFunction? _bets;
  ContractFunction? _myGoals;
  ContractFunction? _myEnteredGoals;

  ContractFunction? _approve;
  ContractFunction? _burn;
  ContractFunction? _burnFrom;
  ContractFunction? _mint;
  ContractFunction? _pause;
  ContractFunction? _permit;
  ContractFunction? _renounceOwnership;
  ContractFunction? _transfer;
  ContractFunction? _transferFrom;
  ContractFunction? _transferOwnership;
  ContractFunction? _unpause;
  ContractFunction? _allowance;
  ContractFunction? _balanceOf;
  ContractFunction? _decimals;
  ContractFunction? _DOMAIN_SEPARATOR;
  ContractFunction? _eip712Domain;
  ContractFunction? _name;
  ContractFunction? _nonces;
  ContractFunction? _owner;
  ContractFunction? _paused;
  ContractFunction? _symbol;
  ContractFunction? _totalSupply;

  List<dynamic> goals = [];
  List<dynamic> myEnteredGoals = [];
  List<dynamic> myCreatedGoals = [];
  String publicAddr = '';

  final String addr = dotenv.env['CONTRACT_ADDRESS']!;
  // final String addrToken = dotenv.env['CONTRACT_ADDRESS_TOKEN']!;

  final String _rpcUrl =
      'https://sepolia.infura.io/v3/1bac17a54bf944d591a6be48d3c7514c';
  // final String _wsUrl = Platform.isAndroid
  //     ? 'https://polygon-amoy.infura.io/v3/1bac17a54bf944d591a6be48d3c7514c'
  //     : 'https://polygon-amoy.infura.io/v3/1bac17a54bf944d591a6be48d3c7514c';
  // final String _privateKey =
  //     "bb0d0d19d4a7accc48219471f8b8588e7672eb7b1f715d63d46c523a3c93e91a";

  initialSetup() async {
    http.Client httpClient = http.Client();
    _ethClient = Web3Client(_rpcUrl, httpClient);

    await getAbi();
    await getCredential();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile =
        await rootBundle.loadString("build/contracts/transacaoParcelada.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abi = jsonEncode(jsonAbi['abi']);

    // String abiStringFileToken =
    //     await rootBundle.loadString("build/contracts/GoalsToken.json");
    // var jsonAbiToken = jsonDecode(abiStringFileToken);
    // _abiToken = jsonEncode(jsonAbiToken['abi']);

    _contractAddress = EthereumAddress.fromHex(addr);
    // _contractAddressToken = EthereumAddress.fromHex(addrToken);
  }

  Future<void> getCredential() async {
    _credentials = EthPrivateKey.fromHex(privKey);
    publicAddr = _credentials!.address.toString();
    address = _credentials!.address;
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abi!, "transacaoParcelada"), _contractAddress!);

    // _contractToken = DeployedContract(
    //     ContractAbi.fromJson(_abiToken!, "GoalsToken"), _contractAddressToken!);

    // _userName = _contract!.function("userName");
    // _setName = _contract!.function("setName");

    // _approve = _contractToken!.function("approve");
    // _burn = _contractToken!.function("burn");
    // _burnFrom = _contractToken!.function("burnFrom");
    // _mint = _contractToken!.function("mint");
    // _pause = _contractToken!.function("pause");
    // _permit = _contractToken!.function("permit");
    // _renounceOwnership = _contractToken!.function("renounceOwnership");
    // _transfer = _contractToken!.function("transfer");
    // _transferFrom = _contractToken!.function("transferFrom");
    // _transferOwnership = _contractToken!.function("transferOwnership");
    // _unpause = _contractToken!.function("unpause");
    // _allowance = _contractToken!.function("allowance");
    // _balanceOf = _contractToken!.function("balanceOf");
    // _decimals = _contractToken!.function("decimals");
    // _DOMAIN_SEPARATOR = _contractToken!.function("DOMAIN_SEPARATOR");
    // _eip712Domain = _contractToken!.function("eip712Domain");
    // _name = _contractToken!.function("name");
    // _nonces = _contractToken!.function("nonces");
    // _owner = _contractToken!.function("owner");
    // _paused = _contractToken!.function("paused");
    // _symbol = _contractToken!.function("symbol");
    // _totalSupply = _contractToken!.function("totalSupply");
  }

  approve(EthereumAddress spender, BigInt amount) async {
    isLoading = true;
    state = isLoading;
    print(_credentials!.address);
    try {
      var gasPrice = await _ethClient!.getGasPrice();
      String tran = await _ethClient!.sendTransaction(
        _credentials!,
        Transaction.callContract(
          contract: _contractToken!,
          function: _approve!,
          parameters: [spender, amount],
          from: _credentials!.address,
        ),
        chainId: 11155111,
      );

      print(tran);
      TransactionReceipt? receipt;
      while (true) {
        receipt = await _ethClient!.getTransactionReceipt(tran);
        print(receipt);
        if (receipt != null) {
          break;
        }
        await Future.delayed(const Duration(seconds: 1));
      }
      print(tran);
    } catch (e) {
      print(e);
    }
  }

  // balanceOf(EthereumAddress addr) async {
  //   var balance = await _ethClient!.call(
  //       contract: _contractToken!,
  //       function: _balanceOf!,
  //       params: [addr],
  //       sender: _credentials!.address);
  //   print(balance);
  //   return balance;
  // }

  transfer(EthereumAddress to, BigInt amount) async {
    String tran = await _ethClient!.sendTransaction(
      _credentials!,
      Transaction.callContract(
        contract: _contractToken!,
        function: _transfer!,
        parameters: [to, amount],
        from: _credentials!.address,
      ),
      chainId: 11155111,
    );
    print(tran);
  }
}
