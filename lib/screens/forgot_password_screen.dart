import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/helpers/app_buttons.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/app_text_field.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/helpers/top_navigation_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.backgroundColor,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            backNavigationBar(title: ''),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  Heading3Text(forgotPwdString.tr, weight: TextWeight.medium),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Heading6Text(
                    helpToGetAccountString.tr,
                    weight: TextWeight.medium,
                    textAlign: TextAlign.start,
                  ).setPadding(top: 10, bottom: 40),
                  addTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Heading5Text(
                      loginAnotherAccountString.tr,
                      weight: TextWeight.medium,
                      textAlign: TextAlign.start,
                    ).ripple(() {
                      Get.back();
                    }),
                  ),
                  const Spacer(),
                  addSubmitBtn(),
                  const SizedBox(
                    height: 55,
                  )
                ],
              ).hp(AppConstants.horizontalPadding),
            ),
          ]),
        ));
  }

  addTextField() {
    return AppTextField(
      controller: email,
      hintText: enterEmailString.tr,
    );
  }

  addSubmitBtn() {
    return AppThemeButton(
      onPress: () {},
      text: sendOTPString.tr,
    ).setPadding(top: 25);
  }
}
