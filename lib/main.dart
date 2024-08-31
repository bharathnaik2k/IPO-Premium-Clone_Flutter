import 'package:flutter/material.dart';

import 'export_port.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Sans"),
      title: "IPO Premium Clone",
      initialRoute: "/SplashScreen",
      routes: {
        "/SplashScreen": (context) => const SplashScreen(),
        "/BottomNaviBar": (context) => const BottomNaviBar(),
        "/IpoScreen": (context) => const IpoScreen(),
        "/OpenScreen": (context) => const OpenScreen(),
        "/SettingScreen": (context) => const SettingScreen(),
        "/NotificationScreen": (context) => const NotificationScreen(),
        "/FlotingScreen": (context) => const FlotingButtonScreen(),
      },
    );
  }
}
