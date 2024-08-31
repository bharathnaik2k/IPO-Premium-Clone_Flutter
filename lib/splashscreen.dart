import 'package:flutter/material.dart';

import 'export_port.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateHomeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/BottomNaviBar");
    }
  }

  @override
  void initState() {
    navigateHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 15, end: 100),
        duration: const Duration(seconds: 3),
        curve: Curves.easeIn,
        builder: (context, value, child) {
          return Stack(
            children: [
              Center(
                child: ScaleTransition(
                  scale: AlwaysStoppedAnimation(value),
                  child: Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Center(
                child: ScaleTransition(
                  scale: AlwaysStoppedAnimation(value),
                  child: Container(
                    height: value - 15,
                    width: value - 15,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/image/ipo_premium.png"),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3,
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/image/ssl_secured.png"),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
