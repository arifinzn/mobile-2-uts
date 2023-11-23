import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kel7/controllers/login_controller.dart';
import 'package:kel7/helpers/app_buttons.dart';
import 'package:kel7/helpers/app_constants.dart';
import 'package:kel7/helpers/custom_texts.dart';
import 'package:kel7/helpers/extension.dart';
import 'package:kel7/helpers/localization_strings.dart';
import 'package:kel7/helpers/rounded_input_field.dart';
import 'package:kel7/screens/auth/login_screen.dart';
import 'package:kel7/widgets/password_changed_popup.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String token;

  const ResetPasswordScreen({Key? key, required this.token}) : super(key: key);

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // final UserProfileManager _userProfileManager = Get.find();

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  late String token;

  final LoginController controller = Get.find();

  @override
  void initState() {
    super.initState();
    token = widget.token;
  }

  @override
  void dispose() {
    controller.passwordReset = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 120,
              ),
              // Center(
              //     child: Image.asset(
              //   'assets/logo.png',
              //   width: 80,
              //   height: 25,
              // )),

              Heading2Text(
                resetPwdString.tr,
                weight: TextWeight.bold,
                color: AppConstants.themeColor,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 40,
              ),
              addTextField(newPassword, newPasswordString.tr),
              addTextField(confirmPassword, confirmPasswordString.tr).tP25,
              const Spacer(),
              addSubmitBtn(),
              const SizedBox(
                height: 55,
              )
            ]).setPadding(left: 25, right: 25),
            GetBuilder<LoginController>(
                init: controller,
                builder: (ctx) {
                  return controller.passwordReset == true
                      ? Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: PasswordChangedPopup(dismissHandler: () {
                            controller.passwordReset = false;
                            // _userProfileManager.logout();
                            Get.to(() => const LoginScreen());
                          }))
                      : Container();
                })
          ],
        ),
      ),
    );
  }

  Widget addTextField(TextEditingController controller, String hint) {
    return SizedBox(
      height: 48,
      child: PasswordField(
        onChanged: (value) {},
        controller: controller,
        showRevealPasswordIcon: true,
        hintText: hint,
      ),
    ).vP8.borderWithRadius(
          value: 1,
          radius: 5,
          color: AppConstants.dividerColor,
        );
  }

  addSubmitBtn() {
    return AppThemeButton(
      onPress: () {
        controller.resetPassword(
          newPassword: newPassword.text.trim(),
          confirmPassword: confirmPassword.text.trim(),
          token: token,
        );
      },
      text: changePwdString.tr,
    );
  }
}
