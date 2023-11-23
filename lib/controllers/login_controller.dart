import 'package:kel7/controllers/info_controller.dart';
import 'package:kel7/helpers/utils/my_string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  LogInController();

  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late final FocusNode emailNode, passwordNode;

  @override
  void onInit() {
    super.onInit();
    emailTE = TextEditingController(text: 'mail@domain.com');
    passwordTE = TextEditingController(text: 'password');
    emailNode = FocusNode();
    passwordNode = FocusNode();
    initFocusNode();
  }

  initFocusNode() {
    emailNode.addListener(() {
      if (emailNode.hasFocus) {}
    });
    passwordNode.addListener(() {
      if (passwordNode.hasFocus) {}
    });
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (!MyStringUtils.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!MyStringUtils.validateStringRange(
      text,
    )) {
      return "Password length must between 8 and 20";
    }
    return null;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      // teddyController.coverEyes(false);
      Info.message("Login success", context: Get.context);
    } else {
      Info.error("Login failed", context: Get.context);
    }
  }
}
