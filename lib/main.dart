import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/cardio_equipments_screen.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/excersice/gym_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/add_measurements_scren.dart';
import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/recover_password_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/welcome_screen.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/dashboard/nutrition_screen.dart';
import 'presentation/screens/nutritionTest/fat_percentage_screen.dart';
import 'presentation/screens/nutritionTest/nutrition_line_identification.dart';
import 'presentation/screens/nutritionTest/nutrition_test_screen.dart';
import 'presentation/screens/outdoor/outdoor_trainings_screen.dart';
import 'presentation/screens/profile/update_password_screen.dart';
import 'presentation/screens/replace_exercise_screen.dart';
import 'presentation/screens/subscribe_plan_screen.dart';
import 'presentation/screens/trainingTest/about_goal_screen.dart';
import 'presentation/screens/trainingTest/choose_training_mode_screen.dart';
import 'presentation/screens/trainingTest/heart_beat_counter_screen.dart';
import 'presentation/screens/trainingTest/heart_rate_screen.dart';
import 'presentation/screens/trainingTest/medical_history_screen.dart';
import 'presentation/screens/trainingTest/physical_activity_screen.dart';
import 'presentation/screens/trainingTest/test_after_training_screen.dart';
import 'presentation/screens/trainingTest/weight_height_screen.dart';

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
      initialRoute: DashboardScreen.tag,
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
