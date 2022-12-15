import 'package:fit_tech/logic/about_goal_provider.dart';
import 'package:fit_tech/logic/biological_gender_provider.dart';
import 'package:fit_tech/logic/choose_training_provider.dart';
import 'package:fit_tech/logic/counted_beats_provider.dart';
import 'package:fit_tech/logic/create_account_provider.dart';
import 'package:fit_tech/logic/excercise/gym_excercise_provider.dart';
import 'package:fit_tech/logic/family_history_provider.dart';
import 'package:fit_tech/logic/heart_rate_provider.dart';
import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/logic/medical_history_provider.dart';
import 'package:fit_tech/logic/nutrition/fat_Percentage_provider.dart';
import 'package:fit_tech/logic/nutrition/nutrition_line_identification_provider.dart';
import 'package:fit_tech/logic/otp_provider.dart';
import 'package:fit_tech/logic/physical_activity_provider.dart';
import 'package:fit_tech/logic/profile/my_data_provider.dart';
import 'package:fit_tech/logic/profile/verify_Identity_provider.dart';
import 'package:fit_tech/logic/recover_password_provider.dart';
import 'package:fit_tech/logic/update_password_provider.dart';
import 'package:fit_tech/logic/verify_code_provider.dart';
import 'package:fit_tech/logic/weight_height_provider.dart';
import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:fit_tech/presentation/screens/onBoarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRoute appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider()),
        ChangeNotifierProvider<RegisterProvider>(
            create: (context) => RegisterProvider()),
        ChangeNotifierProvider<OTPProvider>(create: (context) => OTPProvider()),
        ChangeNotifierProvider<RecoverPasswordProvider>(
            create: (context) => RecoverPasswordProvider()),
        ChangeNotifierProvider<VerifyCodeProvider>(
            create: (context) => VerifyCodeProvider()),
        ChangeNotifierProvider<UpdatePasswordProvider>(
            create: (context) => UpdatePasswordProvider()),
        ChangeNotifierProvider<ChooseTrainingProvider>(
            create: (context) => ChooseTrainingProvider()),
        ChangeNotifierProvider<BiologicalGenderProvider>(
            create: (context) => BiologicalGenderProvider()),
        ChangeNotifierProvider<WeightHeightProvider>(
            create: (context) => WeightHeightProvider()),
        ChangeNotifierProvider<AboutGoalProvider>(
            create: (context) => AboutGoalProvider()),
        ChangeNotifierProvider<PhysicalActivityProvider>(
            create: (context) => PhysicalActivityProvider()),
        ChangeNotifierProvider<MedicalHistoryProvider>(
            create: (context) => MedicalHistoryProvider()),
        ChangeNotifierProvider<FamilyHistoryProvider>(
            create: (context) => FamilyHistoryProvider()),
        ChangeNotifierProvider<HeartRateProvider>(
            create: (context) => HeartRateProvider()),
        ChangeNotifierProvider<CountedBeatsProvider>(
            create: (context) => CountedBeatsProvider()),
        ChangeNotifierProvider<NutritionLineIdentificationProvider>(
            create: (context) => NutritionLineIdentificationProvider()),
        ChangeNotifierProvider<FatPercentageProvider>(
            create: (context) => FatPercentageProvider()),
        ChangeNotifierProvider<MyDataProvider>(
            create: (context) => MyDataProvider()),
        ChangeNotifierProvider<VerifyIdentityProvider>(
            create: (context) => VerifyIdentityProvider()),
        ChangeNotifierProvider<GymExerciseProvider>(
            create: (context) => GymExerciseProvider()),
      ],
      child: MaterialApp(
        title: 'FITTECH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: WelcomeScreen.tag,
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }
}
