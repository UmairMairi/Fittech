import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:fit_tech/presentation/screens/about/privacy_policy_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/about/terms_conditions_screen.dart';
import 'presentation/screens/onBoarding/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRoute appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FITTECH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomeScreen.tag,
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
