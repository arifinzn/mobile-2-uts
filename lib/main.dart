import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kel7/controllers/home_controller.dart';
import 'package:kel7/controllers/login_controller.dart';
import 'package:kel7/controllers/post_controller.dart';
import 'package:kel7/controllers/profile_controller.dart';
import 'package:kel7/controllers/settings_controller.dart';
import 'package:kel7/helpers/user_profile_manager.dart';
import 'package:kel7/screens/home/home_screen.dart';
import 'package:kel7/screens/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  Get.put(DashboardController());
  Get.put(UserProfileManager());

  Get.put(SettingsController());
  Get.put(LoginController());
  Get.put(HomeController());
  Get.put(PostController());
  Get.put(ProfileController());

  runApp(Phoenix(
      child: const MainApp(
    startScreen: SplashScreen(),
  )));
}

class MainApp extends StatelessWidget {
  final Widget startScreen;
  const MainApp({Key? key, required this.startScreen}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     initialRoute: '/Splash',
  //     onGenerateRoute: RouteGenerator.generateRoute,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(child: FutureBuilder<Locale>(
        // future: SharedPrefs().getLocale(),
        builder: (context, snapshot) {
      // if (snapshot.hasData) {
      return GetMaterialApp(
          // translations: Languages(),
          // locale: snapshot.data!,
          // fallbackLocale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          home: startScreen,
          builder: EasyLoading.init(),
          themeMode: ThemeMode.light,
          localizationsDelegates: []);
      // } else {
      //   return Container();
      // }
    }));
  }
}
