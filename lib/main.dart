import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/testimonial_screen.dart';
import 'presentation/screens/today_workout_screen.dart';


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
      initialRoute: TodayWorkoutScreen.tag,
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
