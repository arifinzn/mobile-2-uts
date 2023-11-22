import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/screens/login_screen.dart';
import 'package:kel7/screens/phone_login_screen.dart';

class SocialLoginScreen extends StatefulWidget {
  final bool hidePhoneLogin;

  const SocialLoginScreen({Key? key, required this.hidePhoneLogin})
      : super(key: key);

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.hidePhoneLogin == false
            ? Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: AppConstants.themeColor.withOpacity(0.2),
                child: Center(
                    child: Image.asset(
                  'assets/phone.png',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ))).round(10).ripple(() {
                Get.offAll(() => const PhoneLoginScreen());
              })
            : Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: AppConstants.themeColor.withOpacity(0.2),
                child: Center(
                    child: Image.asset(
                  'assets/email.png',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ))).round(10).ripple(() {
                Get.offAll(() => const LoginScreen());
              }),
        Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: AppConstants.themeColor.withOpacity(0.2),
            child: Center(
                child: Image.asset(
              'assets/google.png',
              height: 20,
              width: 20,
            ))).round(10).ripple(() {
          signInWithGoogle();
        }),
        Platform.isIOS
            ? Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: AppConstants.themeColor.withOpacity(0.2),
                child: Center(
                    child: Image.asset(
                  'assets/apple.png',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ))).round(10).ripple(() {
                //signInWithGoogle();
                _handleAppleSignIn();
                // Get.to(() => const InstagramView());
              })
            : const SizedBox.shrink(),
        Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: AppConstants.themeColor.withOpacity(0.2),
            child: Center(
                child: Image.asset(
              'assets/facebook.png',
              height: 20,
              width: 20,
            ))).round(10).ripple(() {
          fbSignInAction();
        }),
      ],
    );
  }

  void signInWithGoogle() async {}

  void fbSignInAction() async {}

  void socialLogin(String type, String userId, String name, String email) {}

  Future<void> _handleAppleSignIn() async {}
}
