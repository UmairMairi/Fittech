import 'package:fit_tech/presentation/screens/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case WelcomeScreen.tag:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case CreateAccountScreen.tag:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      default:
        return null;
    }
  }

  void dispose() {

  }
}
