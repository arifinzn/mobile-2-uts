import 'package:flutter/material.dart';
import 'package:kel7/controllers/login_controller.dart';
import 'package:kel7/screens/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  Get.put(LoginController());
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
