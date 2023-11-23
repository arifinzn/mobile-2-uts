import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/controllers/login_controller.dart';
import 'package:kel7/helpers/app_buttons.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/app_text_field.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/screens/auth/forgot_password_screen.dart';
import 'package:kel7/screens/auth/register_screen.dart';
import 'package:kel7/screens/auth/social_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final LoginController controller = Get.find();

  bool showPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SingleChildScrollView(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SizedBox(
              height: Get.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    Heading3Text(signInMessageString.tr,
                        weight: TextWeight.medium),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    AppTextField(
                      controller: email,
                      hintText: emailOrUsernameString.tr,
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    AppPasswordTextField(
                      controller: password,
                      hintText: passwordString.tr,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    addLoginBtn(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const ForgotPasswordScreen());
                      },
                      child: Center(
                        child: BodySmallText(
                          forgotPwdString.tr,
                          weight: TextWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1,
                          width: Get.width * 0.37,
                          color: AppConstants.themeColor,
                        ),
                        Heading6Text(
                          orString.tr,
                        ),
                        Container(
                          height: 1,
                          width: Get.width * 0.37,
                          color: AppConstants.themeColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    const SocialLoginScreen(
                      hidePhoneLogin: true,
                    ).setPadding(left: 65, right: 65),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Heading6Text(
                          dontHaveAccountString.tr,
                        ),
                        Heading6Text(
                          signUpString.tr,
                          weight: TextWeight.medium,
                          color: AppConstants.themeColor,
                        ).ripple(() {
                          Get.to(() => const RegisterScreen());
                        }),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                  ]),
            )).setPadding(left: 25, right: 25),
      ),
    );
  }

  Widget addLoginBtn() {
    return AppThemeButton(
      onPress: () {
        controller.login(email.text.trim(), password.text.trim());
      },
      text: signInString.tr,
    );
  }
}
