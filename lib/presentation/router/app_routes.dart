import 'package:fit_tech/presentation/screens/break_between_series_screen.dart';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:fit_tech/presentation/screens/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/about_goal_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/biological_gender_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/choose_training_mode_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/weight_height_screen.dart';
import 'package:fit_tech/presentation/screens/training_completed_screen.dart';
import 'package:fit_tech/presentation/screens/warmup_screen.dart';
import 'package:fit_tech/presentation/screens/intro_screen.dart';
import 'package:fit_tech/presentation/screens/login_screen.dart';
import 'package:fit_tech/presentation/screens/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/otp_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/recover_password_screen.dart';
import 'package:fit_tech/presentation/screens/register_screen.dart';
import 'package:fit_tech/presentation/screens/replace_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/breaks_screen.dart';
import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/screens/test_incomplete_screen.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/presentation/screens/verify_code_screen.dart';
import 'package:fit_tech/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

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
      default:
        return null;
    }
  }

  void dispose() {}
}
