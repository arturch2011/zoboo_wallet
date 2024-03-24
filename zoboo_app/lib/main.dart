import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:zoboo_app/pages/home_page.dart';
import 'package:zoboo_app/pages/login_page.dart';
import 'package:zoboo_app/pages/stats_page.dart';
import 'package:zoboo_app/pages/swap_page.dart';
import 'package:zoboo_app/providers/user_info_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zoboo_app/utils/eth_utils.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const riverpod.ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Outfit',
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(104, 80, 255, 1),
              primary: const Color.fromRGBO(104, 80, 255, 1),
              secondary: const Color.fromRGBO(61, 206, 252, 1)),
          scaffoldBackgroundColor: const Color.fromRGBO(250, 251, 253, 1),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          useMaterial3: true,
        ),
        title: 'Goals App',
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> appInitializer() async {
    await context.read<UserProvider>().initPlatformState();

    final isLogged = context.read<UserProvider>().isLogged;
    if (isLogged) {
      print(context.read<UserProvider>().userInfos[0]['privKey']);
      await getPrivKey(context.read<UserProvider>().userInfos[0]['privKey']);
    }
    print(isLogged);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: appInitializer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: const Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final isLogged = context.watch<UserProvider>().isLogged;
            // Use isLogged here
            return isLogged
                ? riverpod.Consumer(
                    builder: (context, ref, child) {
                      ref.watch(ethUtilsProviders);
                      final ethUtils = ref.read(ethUtilsProviders.notifier);
                      Future<void> initGoals() async {
                        await ethUtils.initialSetup();
                      }

                      return FutureBuilder(
                        future: initGoals(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                                color: Colors.white,
                                child: const Center(
                                    child: CircularProgressIndicator()));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return const MysHomePage();
                          }
                        },
                      );
                    },
                  )
                : const LoginPage();
          }
        });
  }
}

class MysHomePage extends StatefulWidget {
  const MysHomePage({super.key});

  @override
  State<MysHomePage> createState() => _MysHomePageState();
}

class _MysHomePageState extends State<MysHomePage> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentPage) {
      case 0:
        page = const SwapPage();
        break;
      case 1:
        page = const HomePage();
        break;
      // case 2:
      //   page = const CameraApp();
      //   break;
      case 2:
        page = const StatsPage();
        break;
      default:
        throw UnimplementedError('no widget for $currentPage');
    }
    return Scaffold(
      body: Stack(
        children: [
          page,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white, // Cor de fundo
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Sombra
                    spreadRadius: 2,
                    blurRadius: 5,
                    // Ajuste a sombra vertical aqui
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 25), // Margem superior
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: 20), // Padding interno
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0, // Cor de fundo
                  iconSize: 20,

                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  enableFeedback: false,
                  onTap: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  currentIndex: currentPage,
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Icon(
                          Icons.swap_horiz,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.swap_horiz,
                        size: 30,
                      ),
                      label: 'Projects',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Icon(
                          Icons.wallet,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.wallet,
                        size: 30,
                      ),
                      label: 'Wallet',
                    ),
                    // BottomNavigationBarItem(
                    //   activeIcon: Container(
                    //     padding: const EdgeInsets.all(12),
                    //     decoration: const BoxDecoration(
                    //       color: Color.fromRGBO(217, 217, 217, 1),
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(50),
                    //       ),
                    //     ),
                    //     child: const Icon(Icons.camera_alt_outlined, size: 30, color: Color.fromARGB(255, 68, 68, 68)),
                    //   ),
                    //   icon: const Icon(Icons.camera_alt_outlined, size: 30, color: Color.fromARGB(255, 68, 68, 68)),
                    //   label: 'Camera',
                    // ),
                    BottomNavigationBarItem(
                      activeIcon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
