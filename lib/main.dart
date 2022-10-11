import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:fit_tech/presentation/screens/intro_screen.dart';
import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/recover_password_screen.dart';
import 'presentation/screens/test_incomplete_screen.dart';

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
      initialRoute: IntroScreen.tag,
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
