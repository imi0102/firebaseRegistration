import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop() {
    return _navigationKey.currentState?.pop();
  }

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? navigateToAndClearBackStack(String routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  Future<dynamic>? navigateToReplacement(String routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState?.pushReplacementNamed(routeName);
  }

  Future<dynamic> navigateToCloseApp() {
    return SystemNavigator.pop();
    ;
  }
}
