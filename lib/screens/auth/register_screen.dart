import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:kel7/controllers/login_controller.dart';
import 'package:kel7/helpers/app_buttons.dart';

import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/app_text_field.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/helpers/theme_icon.dart';
import 'package:kel7/screens/auth/social_login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String countryCode = '+62';
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Heading3Text(signUpString.tr, weight: TextWeight.medium),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                GetBuilder<LoginController>(
                    init: loginController,
                    builder: (ctx) {
                      return Stack(children: [
                        AppTextField(
                          controller: name,
                          hintText: userNameString.tr,
                          onChanged: (value) {
                            if (value.length > 3) {
                              loginController.verifyUsername(value);
                            }
                          },
                        ),
                        Positioned(
                            right: 10,
                            bottom: 15,
                            child: loginController.userNameCheckStatus != -1
                                ? loginController.userNameCheckStatus == 1
                                    ? ThemeIconWidget(
                                        ThemeIcon.checkMark,
                                        color: AppConstants.themeColor,
                                      )
                                    : ThemeIconWidget(
                                        ThemeIcon.close,
                                        color: AppConstants.red,
                                      )
                                : Container()),
                        const SizedBox(
                          width: 20,
                        )
                      ]);
                    }),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                addTextField(email, emailString.tr),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                AppPasswordTextField(
                  controller: password,
                  hintText: passwordString.tr,
                  onChanged: (value) {
                    loginController.checkPassword(value);
                  },
                ),
                Obx(() {
                  return loginController.passwordStrength.value < 0.8 &&
                          password.text.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            LinearProgressIndicator(
                              value: loginController.passwordStrength.value,
                              backgroundColor: Colors.grey[300],
                              color: loginController.passwordStrength.value <=
                                      1 / 4
                                  ? Colors.red
                                  : loginController.passwordStrength.value ==
                                          2 / 4
                                      ? Colors.yellow
                                      : loginController
                                                  .passwordStrength.value ==
                                              3 / 4
                                          ? Colors.blue
                                          : Colors.green,
                              minHeight: 5,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            BodySmallText(
                              loginController.passwordStrengthText.value,
                            ),
                          ],
                        )
                      : Container();
                }),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                AppPasswordTextField(
                  controller: confirmPassword,
                  hintText: confirmPasswordString.tr,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: signingInTermsString.tr,
                          style: TextStyle(
                              fontSize: FontSizes.b4,
                              color: AppConstants.grayscale900)),
                      TextSpan(
                          text: ' ${termsOfServiceString.tr}',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // loginController.launchUrlInBrowser(
                              //     settingsController
                              //         .setting.value!.termsOfServiceUrl!);
                            },
                          style: TextStyle(
                              fontSize: FontSizes.b4,
                              color: AppConstants.themeColor)),
                      TextSpan(
                          text: ' ${andString.tr}',
                          style: TextStyle(
                              fontSize: FontSizes.b4,
                              color: AppConstants.grayscale900)),
                      TextSpan(
                          text: ' ${privacyPolicyString.tr}',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // loginController.launchUrlInBrowser(
                              //     settingsController
                              //         .setting.value!.privacyPolicyUrl!);
                            },
                          style: TextStyle(
                              fontSize: FontSizes.b4,
                              color: AppConstants.themeColor)),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                addSignUpBtn(),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: Get.width * 0.35,
                      color: AppConstants.themeColor,
                    ),
                    Heading5Text(
                      orString.tr,
                    ),
                    Container(
                      height: 1,
                      width: Get.width * 0.35,
                      color: AppConstants.themeColor,
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                const SocialLoginScreen(hidePhoneLogin: true)
                    .setPadding(left: 45, right: 45),
                SizedBox(
                  height: Get.height * 0.2,
                ),
              ]),
        ).setPadding(left: 25, right: 25),
      ),
    );
  }

  Widget addTextField(TextEditingController controller, String hintText) {
    return AppTextField(
      controller: controller,
      hintText: hintText,
    );
  }

  addSignUpBtn() {
    return AppThemeButton(
      onPress: () {
        FocusScope.of(context).requestFocus(FocusNode());
        // loginController.register(
        //   name: name.text,
        //   email: email.text,
        //   password: password.text,
        //   confirmPassword: confirmPassword.text,
        // );
      },
      text: signUpString.tr,
    );
  }
}
