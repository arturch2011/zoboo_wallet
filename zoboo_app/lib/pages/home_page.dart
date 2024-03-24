import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoboo_app/providers/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:zoboo_app/utils/eth_utils.dart';
import 'package:web3dart/web3dart.dart';
import 'package:clipboard/clipboard.dart';
import 'package:zoboo_app/widgets/profile_avatar.dart';
import 'package:zoboo_app/widgets/receive_tab.dart';
import 'package:zoboo_app/widgets/token_tab.dart';
import 'package:zoboo_app/widgets/transfer_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String statusSelecionado = 'Ativos';
  String statusSelecionado2 = 'Andamento';
  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;

    try {
      name = context.watch<UserProvider>().userInfos[0]['userInfo']["name"];
      email =
          context.watch<UserProvider>().userInfos[0]['userInfo']["verifierId"];
      Map infos = context.watch<UserProvider>().userInfos[0]['userInfo'];
      print('IIIIIIIIIIIII $infos');
    } catch (e) {
      name = null;
      email = null;
    }

    final String nameFinal;

    name == null ? nameFinal = "Usuário" : nameFinal = name;

    final String emailFinal;

    email == null ? emailFinal = "@" : emailFinal = email;

    return riverpod.Consumer(
      builder: (context, ref, child) {
        ref.watch(ethUtilsProviders);
        final ethUtils = ref.read(ethUtilsProviders.notifier);
        EthereumAddress? myAddr = ethUtils.address;

        String address = ethUtils.publicAddr;

        List<dynamic> balance = [];

        Future<void> getInfos() async {
          print('AAAAAAAAAA $myAddr');
          // balance = await ethUtils.balanceOf(myAddr!);
        }

        final Widget tokensTab;
        final Widget transferTab;
        final Widget receiveTab;

        if (1 == 1) {
          tokensTab = Container(
            child: Column(
              children: [
                Center(child: Text('No Tokens Found')),
                TextButton(
                  onPressed: () {},
                  child: Text('Add Tokens'),
                )
              ],
            ),
          );
        }

        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return const Menu();
                        //     },
                        //   ),
                        // );
                      },
                      icon: const Icon(
                        Icons.settings,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Stack(children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Sombra
                              spreadRadius: 1,
                              blurRadius: 5,
                              // Ajuste a sombra vertical aqui
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 90,
                                    height: 60,
                                  ),
                                  FutureBuilder(
                                    future: getInfos(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Text(
                                          "\$ ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        );
                                      } else if (snapshot.hasError) {
                                        return const Text(
                                          "\$ ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: Text(
                                            "\$ ${balance}",
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nameFinal,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(emailFinal,
                                          style: const TextStyle(fontSize: 12)),
                                      const SizedBox(height: 5),
                                      GestureDetector(
                                        onTap: () {
                                          FlutterClipboard.copy(address)
                                              .then((value) {
                                            const snackBar = SnackBar(
                                              content: Text(
                                                  'Copiado para a área de transferência'),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          });
                                        },
                                        child: Row(children: [
                                          Text(
                                              'Address: ${address.substring(0, 6)}...',
                                              style: const TextStyle(
                                                  fontSize: 12)),
                                          const SizedBox(width: 5),
                                          const Icon(Icons.copy, size: 15),
                                        ]),
                                      ),
                                    ],
                                  ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: SvgPicture.asset(
                                  //       'assets/icons/edit.svg',
                                  //       width: 27,
                                  //       height: 27),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Positioned(
                    top: 0,
                    left: 30,
                    child: BuildProfileAvatar(size: 50),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              statusSelecionado = 'Ativos';
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: statusSelecionado == 'Ativos'
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Tokens",
                            style: TextStyle(
                                color: statusSelecionado == 'Ativos'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              statusSelecionado = 'Concluidos';
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: statusSelecionado == 'Concluidos'
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Transfer",
                            style: TextStyle(
                                color: statusSelecionado == 'Concluidos'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              statusSelecionado = 'Criados';
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: statusSelecionado == 'Criados'
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Receive",
                            style: TextStyle(
                                color: statusSelecionado == 'Criados'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (statusSelecionado == 'Ativos')
                  TokenListView()
                else if (statusSelecionado == 'Concluidos')
                  TransferTab()
                else
                  QrCodeWidget(
                    qrData: myAddr.toString(),
                    name: emailFinal,
                  ),
              ],
            ),
          )),
        );
      },
    );
  }
}
