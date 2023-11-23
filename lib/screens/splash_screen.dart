import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _route();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _route() async {
    Timer(const Duration(seconds: 5), () async {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/sosmed.png",
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
