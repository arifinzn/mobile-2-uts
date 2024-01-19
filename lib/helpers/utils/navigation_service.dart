import 'package:flutter/material.dart';

/// Navigation service without state.
class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop({Object? argument}) {
    return _navigationKey.currentState?.pop(argument);
  }

  void popUntil() {
    int count = 0;
    return _navigationKey.currentState?.popUntil((_) => count++ >= 2);
  }

  Future<dynamic> popTo(String routeName, {Object? arguments}) {
    return _navigationKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  /// as `pushNamed()`
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  /// as `pushReplacementNamed()`
  Future<dynamic> moveTo(String routeName,
      {Object? arguments, Object? result}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments, result: result);
  }

  /// as `pushNamedAndRemoveUntil()`
  Future<dynamic> pushTo(String routeName, {Object? arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
