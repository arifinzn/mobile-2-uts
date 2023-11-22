import 'package:flutter/material.dart';
import 'package:kel7/helpers/route_generator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/Splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
