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
  EtherAmount? balance;
  int xchainId = 534351;

  ContractFunction? _createTransaction;
  ContractFunction? _executeParcel;
  ContractFunction? _executeAutomation;
  ContractFunction? _getMyTransactions;
  ContractFunction? _getTransactions;
  ContractFunction? _stakeEth;
  ContractFunction? _myStakedEth;
  ContractFunction? _withdrawStakedEth;

  String publicAddr = '';
  BigInt bal = BigInt.from(0);

  final String addr = dotenv.env['CONTRACT_ADDRESS']!;
  // final String addrToken = dotenv.env['CONTRACT_ADDRESS_TOKEN']!;

  final String _rpcUrl = 'https://sepolia-rpc.scroll.io/';

  initialSetup() async {
    http.Client httpClient = http.Client();
    _ethClient = Web3Client(_rpcUrl, httpClient);

    await getAbi();
    await getCredential();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle
        .loadString("contractsBuild/contracts/transacaoParcelada.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abi = jsonEncode(jsonAbi['abi']);

    _contractAddress = EthereumAddress.fromHex(addr);
  }

  Future<void> getCredential() async {
    print("ZZZZZZZZZZZZZZZZZZZZ $privKey ");
    _credentials = EthPrivateKey.fromHex(privKey);
    print("ZZZZZZZZZZZZZZZZZZZZ $_credentials ");
    publicAddr = _credentials!.address.toString();
    print("ZZZZZZZZZZZZZZZZZZZZ $publicAddr ");
    address = _credentials!.address;
    print("ZZZZZZZZZZZZZZZZZZZZ $address ");
    balance = await _ethClient!.getBalance(address!);
    print("ZZZZZZZZZZZZZZZZZZZZ $balance ");
    bal = balance!.getInWei;

    print("ZZZZZZZZZZZZZZZZZZZZ $bal ");
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abi!, "transacaoParcelada"), _contractAddress!);

    _createTransaction = _contract!.function("createTransaction");
    _executeParcel = _contract!.function("executeParcel");
    _executeAutomation = _contract!.function("executeAutomation");
    _getMyTransactions = _contract!.function("getMyTransactions");
    _getTransactions = _contract!.function("getTransactions");
    _stakeEth = _contract!.function("stakeEth");
    _myStakedEth = _contract!.function("myStakedEth");
    _withdrawStakedEth = _contract!.function("withdrawStakedEth");
  }

  createTransaction(BigInt parcelas, BigInt quantidade, BigInt slipage) async {
    state = true;
    BigInt total = quantidade + slipage;
    EtherAmount amountTotal = EtherAmount.inWei(total);

    try {
      String tran = await _ethClient!.sendTransaction(
          _credentials!,
          Transaction.callContract(
            contract: _contract!,
            function: _createTransaction!,
            parameters: [parcelas, quantidade, slipage],
            from: _credentials!.address,
            value: amountTotal,
          ),
          chainId: xchainId);
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  executeParcel(BigInt id) async {
    state = true;
    try {
      String tran = await _ethClient!.sendTransaction(
          _credentials!,
          Transaction.callContract(
            contract: _contract!,
            function: _executeParcel!,
            parameters: [id],
            from: _credentials!.address,
          ),
          chainId: xchainId);
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  executeAutomation() async {
    state = true;
    try {
      String tran = await _ethClient!.sendTransaction(
          _credentials!,
          Transaction.callContract(
            contract: _contract!,
            function: _executeAutomation!,
            parameters: [],
            from: _credentials!.address,
          ),
          chainId: xchainId);
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  getMyTransactions() async {
    state = true;
    try {
      var tran = await _ethClient!.call(
          contract: _contract!,
          function: _getMyTransactions!,
          params: [],
          sender: _credentials!.address);
      return tran;
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  getTransactions() async {
    state = true;
    try {
      var tran = await _ethClient!.call(
          contract: _contract!,
          function: _getTransactions!,
          params: [],
          sender: _credentials!.address);

      return (tran);
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  myStakedEth() async {
    state = true;
    try {
      var tran = await _ethClient!.call(
          contract: _contract!,
          function: _myStakedEth!,
          params: [],
          sender: _credentials!.address);

      return (tran);
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  withdrawStakedEth(BigInt amount) async {
    state = true;
    try {
      String tran = await _ethClient!.sendTransaction(
          _credentials!,
          Transaction.callContract(
            contract: _contract!,
            function: _withdrawStakedEth!,
            parameters: [amount],
            from: _credentials!.address,
          ),
          chainId: xchainId);
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  sendEth(String to, BigInt amount) async {
    state = true;
    EthereumAddress addrs = EthereumAddress.fromHex(to);
    EtherAmount amountInWei = EtherAmount.inWei(amount);
    try {
      await _ethClient!.sendTransaction(
        _credentials!,
        Transaction(to: addrs, value: amountInWei, maxGas: 2000000),
        chainId: xchainId,
      );
    } catch (e) {
      print(e.toString);
    }
    state = false;
  }

  // balanceOf(EthereumAddress addr) async {
  //   var balance = await _ethClient!._balanceOf
  //   print(balance);
  //   return balance;
  // }
}
