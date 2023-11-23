import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kel7/helpers/user_profile_manager.dart';

class SettingsController extends GetxController {
  final UserProfileManager _userProfileManager = Get.find();

  // Rx<SettingModel?> setting = Rx<SettingModel?>(null);
  RxString currentLanguage = 'en'.obs;

  RxBool bioMetricAuthStatus = false.obs;
  RxBool darkMode = false.obs;
  RxBool shareLocation = false.obs;

  RxInt redeemCoins = 0.obs;
  RxBool forceUpdate = false.obs;
  RxBool? appearanceChanged = false.obs;

  // var localAuth = LocalAuthentication();

  RxInt bioMetricType = 0.obs;
  setCurrentSelectedLanguage() async {
    // String currentLanguage = await SharedPrefs().getLanguage();
    // changeLanguage({'language_code': currentLanguage});
  }

  changeLanguage(Map<String, String> language) async {
    // var locale = Locale(language['language_code']!);
    // Get.updateLocale(locale);
    // currentLanguage.value = language['language_code']!;
    // update();
    // SharedPrefs().setLanguage(language['language_code']!);
  }

  redeemCoinValueChange(int coins) {
    redeemCoins.value = coins;
  }

  loadSettings() async {
    // bool isDarkTheme = await SharedPrefs().isDarkMode();
    // bioMetricAuthStatus.value = await SharedPrefs().getBioMetricAuthStatus();
    // shareLocation.value = _userProfileManager.user.value!.latitude != null;

    // setDarkMode(isDarkTheme);
    // checkBiometric();
  }

  setDarkMode(bool status) async {
    // darkMode.value = status;
    // darkMode.refresh();
    // isDarkMode = status;
    // await SharedPrefs().setDarkMode(status);
    // Get.changeThemeMode(status ? ThemeMode.dark : ThemeMode.light);
  }

  appearanceModeChanged(bool status) async {
    await setDarkMode(status);
    appearanceChanged?.value = !appearanceChanged!.value;
  }

  shareLocationToggle(bool status) {
    // shareLocation.value = status;
    // if (status == true) {
    //   getIt<LocationManager>().postLocation();
    // } else {
    //   getIt<LocationManager>().stopPostingLocation();
    // }
  }

  getSettings() async {
    // String? authKey = await SharedPrefs().getAuthorizationKey();
    // await MiscApi.getSettings(resultCallback: (result) {
    //   setting.value = result;

    //   if (setting.value?.latestVersion! != AppConfigConstants.currentVersion) {
    //     forceUpdate.value = true;
    //     forceUpdate.value = false;
    //   }

    //   update();
    // });
  }

  Future checkBiometric() async {
    // bool bioMetricAuthStatus = true;
    // if (bioMetricAuthStatus == true) {
    //   List<BiometricType> availableBiometrics =
    //       await localAuth.getAvailableBiometrics();

    //   if (availableBiometrics.contains(BiometricType.face)) {
    //     // Face ID.
    //     bioMetricType.value = 1;
    //   } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
    //     // Touch ID.
    //     bioMetricType.value = 2;
    //   }
    // }
    // return;
  }

  void biometricLogin(bool status) async {
    // try {
    //   bool didAuthenticate = await localAuth.authenticate(
    //       localizedReason: status == true
    //           ? pleaseAuthenticateToUseBiometricString.tr
    //           : pleaseAuthenticateToRemoveBiometricString.tr);

    //   if (didAuthenticate == true) {
    //     SharedPrefs().setBioMetricAuthStatus(status);
    //     bioMetricAuthStatus.value = status;
    //   }
    // } on PlatformException catch (e) {
    //   if (e.code == auth_error.notAvailable) {
    //     // Handle this exception here.
    //   }
    // }
  }

  deleteAccount() {
    // AuthApi.deleteAccount(successCallback: () {
    //   _userProfileManager.logout();
    //   AppUtil.showToast(message: accountIsDeletedString.tr, isSuccess: true);
    // });
  }

  askForRating(BuildContext context) {
    // rateMyApp.init().then((value) {
    //   if (rateMyApp.shouldOpenDialog) {
    //     rateMyApp.showRateDialog(context);
    //   }
    // });
  }
}
