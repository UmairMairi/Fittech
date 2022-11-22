import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:fit_tech/presentation/screens/cardio_equipments_screen.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/add_measurements_scren.dart';
import 'package:fit_tech/presentation/screens/onBoarding/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/nutritionTest/fat_percentage_screen.dart';
import 'presentation/screens/nutritionTest/nutrition_details_screen.dart';
import 'presentation/screens/nutritionTest/nutrition_list_screen.dart';

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
        primarySwatch: Colors.grey,
      ),
      initialRoute: WelcomeScreen.tag,
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
