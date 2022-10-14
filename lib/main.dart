import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:fit_tech/presentation/screens/replace_exercise_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/break_between_series_screen.dart';
import 'presentation/screens/breaks_screen.dart';
import 'presentation/screens/exercise_screen.dart';
import 'presentation/screens/trainingTest/about_goal_screen.dart';
import 'presentation/screens/trainingTest/biological_gender_screen.dart';
import 'presentation/screens/trainingTest/choose_training_mode_screen.dart';
import 'presentation/screens/trainingTest/training_test_screen.dart';
import 'presentation/screens/trainingTest/weight_height_screen.dart';
import 'presentation/screens/training_completed_screen.dart';

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
      initialRoute: AboutGoalScreen.tag,
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
