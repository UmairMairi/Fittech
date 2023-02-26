import 'package:fit_tech/logic/about_goal_provider.dart';
import 'package:fit_tech/logic/add_measurements_provider.dart';
import 'package:fit_tech/logic/biological_gender_provider.dart';
import 'package:fit_tech/logic/choose_date_provider.dart';
import 'package:fit_tech/logic/choose_training_provider.dart';
import 'package:fit_tech/logic/counted_beats_provider.dart';
import 'package:fit_tech/logic/create_account_provider.dart';
import 'package:fit_tech/logic/delete_account_provider.dart';
import 'package:fit_tech/logic/excercise/excersice_provider.dart';
import 'package:fit_tech/logic/excercise/gym_excercise_provider.dart';
import 'package:fit_tech/logic/excercise/rest_between_sequence_provider.dart';
import 'package:fit_tech/logic/excercise/rest_between_series_provider.dart';
import 'package:fit_tech/logic/excercise/training_completed_provider.dart';
import 'package:fit_tech/logic/family_history_provider.dart';
import 'package:fit_tech/logic/faq_provider.dart';
import 'package:fit_tech/logic/heart_rate_provider.dart';
import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/logic/medical_history_provider.dart';
import 'package:fit_tech/logic/nutrition/fat_Percentage_provider.dart';
import 'package:fit_tech/logic/nutrition/nutrition_line_identification_provider.dart';
import 'package:fit_tech/logic/nutrition/select_recipe_screen.dart';
import 'package:fit_tech/logic/oboarding/create_account_provider.dart';
import 'package:fit_tech/logic/otp_provider.dart';
import 'package:fit_tech/logic/physical_activity_provider.dart';
import 'package:fit_tech/logic/policies_provider.dart';
import 'package:fit_tech/logic/profile/my_data_provider.dart';
import 'package:fit_tech/logic/profile/test_after_training_provider.dart';
import 'package:fit_tech/logic/profile/verify_Identity_provider.dart';
import 'package:fit_tech/logic/recover_password_provider.dart';
import 'package:fit_tech/logic/update_password_provider.dart';
import 'package:fit_tech/logic/verify_code_provider.dart';
import 'package:fit_tech/logic/weight_height_provider.dart';
import 'package:fit_tech/presentation/router/app_routes.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/welcome_screen.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'data/models/on_boarding_model/login_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoute appRoute = AppRoute();
  var initialRoute = WelcomeScreen.tag;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DeleteAccountProvider>(
            create: (context) => DeleteAccountProvider()),
        ChangeNotifierProvider<CreateAccountProvider>(
            create: (context) => CreateAccountProvider()),
        ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider()),
        ChangeNotifierProvider<RegisterProvider>(
            create: (context) => RegisterProvider()),
        ChangeNotifierProvider<OTPProvider>(create: (context) => OTPProvider()),
        ChangeNotifierProvider<FaqProvider>(create: (context) => FaqProvider()),
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
        ChangeNotifierProvider<AddMeasurementsProviders>(
            create: (context) => AddMeasurementsProviders()),
        ChangeNotifierProvider<ChooseDateProviders>(
            create: (context) => ChooseDateProviders()),
        ChangeNotifierProvider<TestAfterTrainingProvider>(
            create: (context) => TestAfterTrainingProvider()),
        ChangeNotifierProvider<BreakBetweenSeriesProvider>(
            create: (context) => BreakBetweenSeriesProvider()),
        ChangeNotifierProvider<BreakBetweenSequenceProvider>(
            create: (context) => BreakBetweenSequenceProvider()),
        ChangeNotifierProvider<ExerciseProvider>(
            create: (context) => ExerciseProvider()),
        ChangeNotifierProvider<TrainingCompletedProvider>(
            create: (context) => TrainingCompletedProvider()),
        ChangeNotifierProvider<SelectRecipeProvider>(
            create: (context) => SelectRecipeProvider()),
        ChangeNotifierProvider<PoliciesProvider>(
            create: (context) => PoliciesProvider()),
      ],
      child: MaterialApp(
        title: 'FITTECH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute:WelcomeScreen.tag,
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }

}
