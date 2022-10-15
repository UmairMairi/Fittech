import 'package:fit_tech/presentation/screens/about/terms_conditions_screen.dart';
import 'package:fit_tech/presentation/screens/break_between_series_screen.dart';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/register_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/verify_code_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/welcome_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/about_goal_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/biological_gender_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/choose_training_mode_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/enter_counted_beats_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/finishing_training_test_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/physical_activity_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/show_level_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/test_after_training_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/weight_height_screen.dart';
import 'package:fit_tech/presentation/screens/training_completed_screen.dart';
import 'package:fit_tech/presentation/screens/warmup_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/intro_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/recover_password_screen.dart';
import 'package:fit_tech/presentation/screens/replace_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/breaks_screen.dart';
import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/screens/test_incomplete_screen.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:flutter/material.dart';

import '../screens/about/privacy_policy_screen.dart';
import '../screens/trainingTest/family_history_screen.dart';
import '../screens/trainingTest/heart_rate_screen.dart';
import '../screens/trainingTest/heart_status_screen.dart';
import '../screens/trainingTest/medical_history_screen.dart';
import '../screens/trainingTest/heart_beat_counter_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case WelcomeScreen.tag:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case CreateAccountScreen.tag:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case LoginScreen.tag:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.tag:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case OTPScreen.tag:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case LoginWelcomeScreen.tag:
        return MaterialPageRoute(builder: (_) => const LoginWelcomeScreen());
      case SubscribePlanScreen.tag:
        return MaterialPageRoute(builder: (_) => SubscribePlanScreen());
      case RecoverPasswordScreen.tag:
        return MaterialPageRoute(builder: (_) => const RecoverPasswordScreen());
      case VerifyCodeScreen.tag:
        return MaterialPageRoute(builder: (_) => const VerifyCodeScreen());
      case TestIncompleteScreen.tag:
        return MaterialPageRoute(builder: (_) => const TestIncompleteScreen());
      case IntroScreen.tag:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case TestimonialScreen.tag:
        return MaterialPageRoute(builder: (_) => const TestimonialScreen());
      case TodayWorkoutScreen.tag:
        return MaterialPageRoute(builder: (_) => const TodayWorkoutScreen());
      case OutdoorScreen.tag:
        return MaterialPageRoute(builder: (_) => const GymScreen());
      case GymScreen.tag:
        return MaterialPageRoute(builder: (_) => const OutdoorScreen());
      case HeatingScreen.tag:
        return MaterialPageRoute(builder: (_) => const HeatingScreen());
      case RestScreen.tag:
        return MaterialPageRoute(builder: (_) => const RestScreen());
      case ExerciseScreen.tag:
        return MaterialPageRoute(builder: (_) => const ExerciseScreen());
      case ReplaceExerciseScreen.tag:
        return MaterialPageRoute(builder: (_) => const ReplaceExerciseScreen());
      case TrainingCompletedScreen.tag:
        return MaterialPageRoute(builder: (_) => const TrainingCompletedScreen());
      case BreakBetweenSeriesScreen.tag:
        return MaterialPageRoute(builder: (_) => const BreakBetweenSeriesScreen());
      case TrainingTestScreen.tag:
        return MaterialPageRoute(builder: (_) => const TrainingTestScreen());
      case ChooseTrainingModeScreen.tag:
        return MaterialPageRoute(builder: (_) => const ChooseTrainingModeScreen());
      case BiologicalGenderScreen.tag:
        return MaterialPageRoute(builder: (_) => const BiologicalGenderScreen());
      case WeightHeightScreen.tag:
        return MaterialPageRoute(builder: (_) => const WeightHeightScreen());
      case AboutGoalScreen.tag:
        return MaterialPageRoute(builder: (_) => const AboutGoalScreen());
      case PhysicalActivityScreen.tag:
        return MaterialPageRoute(builder: (_) => const PhysicalActivityScreen());
      case MedicalHistoryScreen.tag:
        return MaterialPageRoute(builder: (_) => const MedicalHistoryScreen());
      case FamilyHistoryScreen.tag:
        return MaterialPageRoute(builder: (_) => const FamilyHistoryScreen());
      case HeartRateScreen.tag:
        return MaterialPageRoute(builder: (_) => const HeartRateScreen());
      case HeartBeatCounterScreen.tag:
        return MaterialPageRoute(builder: (_) => const HeartBeatCounterScreen());
      case EnterCountedBeatsScreen.tag:
        return MaterialPageRoute(builder: (_) => const EnterCountedBeatsScreen());
      case HeartStatusScreen.tag:
        return MaterialPageRoute(builder: (_) => const HeartStatusScreen());
      case FinishingTrainingTestScreen.tag:
        return MaterialPageRoute(builder: (_) => const FinishingTrainingTestScreen());
      case TestAfterScreen.tag:
        return MaterialPageRoute(builder: (_) => const TestAfterScreen());
      case ShowLevelScreen.tag:
        return MaterialPageRoute(builder: (_) => const ShowLevelScreen());
      case TermsConditionsScreen.tag:
        return MaterialPageRoute(builder: (_) => const TermsConditionsScreen());
      case PrivacyPolicyScreen.tag:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      default:
        return null;
    }
  }

  void dispose() {}
}
