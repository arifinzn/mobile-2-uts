import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/controllers/login_controller.dart';
import 'package:kel7/helpers/app_buttons.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerifyRegistrationOTPScreen extends StatefulWidget {
  final String token;

  const VerifyRegistrationOTPScreen({Key? key, required this.token})
      : super(key: key);

  @override
  VerifyRegistrationOTPScreenState createState() =>
      VerifyRegistrationOTPScreenState();
}

class VerifyRegistrationOTPScreenState
    extends State<VerifyRegistrationOTPScreen> {
  TextEditingController controller = TextEditingController(text: "");
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 55,
          ),
          // Center(
          //     child: Image.asset(
          //   'assets/logo.png',
          //   width: 80,
          //   height: 25,
          // )),
          const SizedBox(
            height: 50,
          ),
          Heading4Text(
            otpVerificationString.tr,
            weight: TextWeight.bold,
            color: AppConstants.themeColor,
            textAlign: TextAlign.start,
          ),
          BodyLargeText(
            pleaseEnterOneTimePasswordPhoneNumberChangeString.tr,
            textAlign: TextAlign.center,
          ).setPadding(top: 43, bottom: 35),
          Obx(() => PinCodeTextField(
                autofocus: true,
                controller: controller,
                highlightColor: Colors.blue,
                defaultBorderColor: Colors.transparent,
                hasTextBorderColor: Colors.transparent,
                pinBoxColor: AppConstants.themeColor.withOpacity(0.5),
                highlightPinBoxColor: AppConstants.themeColor,
                // highlightPinBoxColor: Colors.orange,
                maxLength: loginController.pinLength,
                hasError: loginController.hasError.value,
                onTextChanged: (text) {
                  loginController.otpTextFilled(text);
                },
                onDone: (text) {
                  loginController.otpCompleted();
                },
                pinBoxWidth: 50,
                pinBoxHeight: 50,
                // hasUnderline: true,
                wrapAlignment: WrapAlignment.spaceAround,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: TextStyle(
                    fontSize: FontSizes.h3, fontWeight: TextWeight.medium),
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration:
                    const Duration(milliseconds: 300),
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.number,
              )),
          Obx(() => Row(
                children: [
                  BodyLargeText(
                    didntReceivedCodeString.tr,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  BodyLargeText(
                    resendOTPString.tr,
                    weight: TextWeight.bold,
                    color: loginController.canResendOTP.value == false
                        ? AppConstants.disabledColor
                        : AppConstants.themeColor,
                  ).ripple(() {
                    if (loginController.canResendOTP.value == true) {
                      loginController.resendOTP(token: widget.token);
                    }
                  }),
                  loginController.canResendOTP.value == false
                      ? TweenAnimationBuilder<Duration>(
                          duration: const Duration(minutes: 2),
                          tween: Tween(
                              begin: const Duration(minutes: 2),
                              end: Duration.zero),
                          onEnd: () {
                            loginController.canResendOTP.value = true;
                            setState(() {});
                          },
                          builder: (BuildContext context, Duration value,
                              Widget? child) {
                            final minutes = value.inMinutes;
                            final seconds = value.inSeconds % 60;
                            return BodyLargeText(' ($minutes:$seconds)',
                                textAlign: TextAlign.center,
                                color: AppConstants.themeColor);
                          })
                      : Container()
                ],
              )).setPadding(top: 20, bottom: 25),
          const Spacer(),
          Obx(() => loginController.otpFilled.value == true
              ? addSubmitBtn()
              : Container()),
          const SizedBox(
            height: 55,
          )
        ]),
      ).setPadding(left: 25, right: 25),
    );
  }

  addSubmitBtn() {
    return AppThemeButton(
      onPress: () {
        loginController.callVerifyOTPForPhoneLogin(
          otp: controller.text,
          token: widget.token,
        );
      },
      text: verifyString.tr,
    );
  }
}
