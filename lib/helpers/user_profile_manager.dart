import 'dart:async';

import 'package:get/get.dart';
import 'package:kel7/models/user_model.dart';
import 'package:kel7/screens/home/home_screen.dart';

class UserProfileManager extends GetxController {
  final DashboardController _dashboardController = Get.find();

  Rx<UserModel?> user = Rx<UserModel?>(null);

  bool get isLogin {
    return user.value != null;
  }

  logout() async {
    user.value = null;

    // await AuthApi.logout();

    // SharedPrefs().clearPreferences();
    // Get.offAll(() => const AuthTab());
    // getIt<SocketManager>().disconnect();
    // getIt<DBManager>().clearAllUnreadCount();
    // getIt<DBManager>().deleteAllChatHistory();

    // GoogleSignIn googleSignIn = GoogleSignIn();
    // googleSignIn.disconnect();
    // Future.delayed(const Duration(seconds: 2), () {
    //   _homeController.indexChanged(0);
    // });
    // SharedPrefs().setBioMetricAuthStatus(false);
  }

  Future refreshProfile() async {
    // String? authKey = await SharedPrefs().getAuthorizationKey();

    // if (authKey != null) {
    //   await ProfileApi.getMyProfile(resultCallback: (result) {
    //     user.value = result;

    //     if (user.value != null) {
    //       setupSocketServiceLocator1();
    //     }
    //     return;
    //   });
    // } else {
    //   return;
    // }
  }
}
