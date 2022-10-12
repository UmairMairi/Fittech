import 'package:fit_tech/presentation/screens/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/gym_screen.dart';
import 'package:fit_tech/presentation/screens/intro_screen.dart';
import 'package:fit_tech/presentation/screens/login_screen.dart';
import 'package:fit_tech/presentation/screens/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/otp_screen.dart';
import 'package:fit_tech/presentation/screens/outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/recover_password_screen.dart';
import 'package:fit_tech/presentation/screens/register_screen.dart';
import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/screens/test_incomplete_screen.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/today_workout_screen.dart';
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
      default:
        return null;
    }
  }

  void dispose() {}
}
