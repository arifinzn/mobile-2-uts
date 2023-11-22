import 'package:flutter/material.dart';
import 'package:kel7/screens/splash_screen.dart';
import 'package:kel7/screens/home_screen.dart';
import 'package:kel7/screens/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
