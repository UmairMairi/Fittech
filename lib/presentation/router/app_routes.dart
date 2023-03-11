import 'package:fit_tech/data/models/faqData/FaqCategories.dart';
import 'package:fit_tech/data/models/recipe/recipe_list_model.dart';
import 'package:fit_tech/logic/add_measurements_provider.dart';
import 'package:fit_tech/presentation/screens/break_between_series_screen.dart';
import 'package:fit_tech/presentation/screens/cardio_equipments_screen.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/dashboard/store_screen.dart';
import 'package:fit_tech/presentation/screens/excersice/gym_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/add_measurements_scren.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/choose_food_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/create_recipe_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/fat_percentage_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/food_list_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/food_type_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/measurement_history_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/nutrition_details_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/nutrition_list_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/nutrition_line_identification.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/recipe_details_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/recipe_list_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/select_recipes_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/toturial_usage_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/register_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/verify_code_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/welcome_screen.dart';
import 'package:fit_tech/presentation/screens/outdoor/outdoor_trainings_screen.dart';
import 'package:fit_tech/presentation/screens/profile/FAQs/faq_details_screen.dart';
import 'package:fit_tech/presentation/screens/profile/about/privacy_policy_screen.dart';
import 'package:fit_tech/presentation/screens/profile/about/terms_conditions_screen.dart';
import 'package:fit_tech/presentation/screens/profile/about_screen.dart';
import 'package:fit_tech/presentation/screens/profile/about/app_founder_screen.dart';
import 'package:fit_tech/presentation/screens/profile/about/contact_screen.dart';
import 'package:fit_tech/presentation/screens/profile/currentPerformance/current_performance_screen.dart';
import 'package:fit_tech/presentation/screens/profile/currentPerformance/performance_training_notes_screen.dart';
import 'package:fit_tech/presentation/screens/profile/FAQs/faq_screen.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/settings/Privacy_screen.dart';
import 'package:fit_tech/presentation/screens/profile/settings/current_plan_screen.dart';
import 'package:fit_tech/presentation/screens/profile/settings/delete_acount_screen.dart';
import 'package:fit_tech/presentation/screens/profile/settings/settings_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/body_mass_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/choose_dates_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/comparison_measurements_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/image_viewer_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/nutrition_stategy_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/test_result_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/tmba_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/weist_circumference_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/weist_height_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/weist_hip_ratio_screen.dart';
import 'package:fit_tech/presentation/screens/profile/training_notes_screen.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_status_screen.dart';
import 'package:fit_tech/presentation/screens/profile/verify_identity_screen.dart';
import 'package:fit_tech/presentation/screens/today_workout.dart';
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

import '../screens/nutritionTest/nutrition_test_screen.dart';
import '../screens/trainingTest/family_history_screen.dart';
import '../screens/trainingTest/heart_rate_screen.dart';
import '../screens/trainingTest/heart_status_screen.dart';
import '../screens/trainingTest/medical_history_screen.dart';
import '../screens/trainingTest/heart_beat_counter_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case WelcomeScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const WelcomeScreen());
      case CreateAccountScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                CreateAccountScreen());
      case LoginScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) => LoginScreen());
      case RegisterScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) => RegisterScreen());
      case OTPScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) => OTPScreen());
      case LoginWelcomeScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const LoginWelcomeScreen());
      case SubscribePlanScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                SubscribePlanScreen());
      case RecoverPasswordScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                RecoverPasswordScreen());
      case VerifyCodeScreen.tag:
        var email = routeSettings.arguments as String?;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                VerifyCodeScreen(email: email,));
      case TestIncompleteScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TestIncompleteScreen());
      case IntroScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const IntroScreen());
      case TestimonialScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TestimonialScreen());
      case TodayTrainingScreen.tag:
        var index = routeSettings.arguments as int?;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                TodayTrainingScreen(
                  index: index ?? 0,
                ));
      case OutdoorScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const OutdoorScreen());
      case GymScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const GymScreen());
      case HeatingScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const HeatingScreen());
      case RestScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const RestScreen());
      case ExerciseScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const ExerciseScreen());
      case GymExerciseScreen.tag:
        var type = routeSettings.arguments as dynamic;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) => GymExerciseScreen(
                  type: type,
                ));
      case ReplaceExerciseScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const ReplaceExerciseScreen());
      case TrainingCompletedScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TrainingCompletedScreen());
      case BreakBetweenSeriesScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const BreakBetweenSeriesScreen());
      case TrainingTestScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TrainingTestScreen());
      case ChooseTrainingModeScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const ChooseTrainingModeScreen());
      case BiologicalGenderScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const BiologicalGenderScreen());
      case WeightHeightScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                WeightHeightScreen());
      case AboutGoalScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const AboutGoalScreen());
      case PhysicalActivityScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const PhysicalActivityScreen());
      case MedicalHistoryScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const MedicalHistoryScreen());
      case FamilyHistoryScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const FamilyHistoryScreen());
      case HeartRateScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const HeartRateScreen());
      case HeartBeatCounterScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const HeartBeatCounterScreen());
      case EnterCountedBeatsScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const EnterCountedBeatsScreen());
      case HeartStatusScreen.tag:
        var isNutritionTest = routeSettings.arguments as bool?;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                HeartStatusScreen(isNutritionTest: (isNutritionTest ?? false)));
      case FinishingTrainingTestScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const FinishingTrainingTestScreen());
      case TestAfterScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TestAfterScreen());
      case ShowLevelScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const ShowLevelScreen());
      case TermsConditionsScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TermsConditionsScreen());
      case PrivacyPolicyScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const PrivacyPolicyScreen());
      case DashboardScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const DashboardScreen());
      case StoreScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const StoreScreen());
      case TodayWorkoutScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TodayWorkoutScreen());
      case MyDataScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const MyDataScreen());
      case VerifyIdentityScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                VerifyIdentityScreen());
      case UpdatePasswordScreen.tag:
        var type = routeSettings.arguments as Types;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                UpdatePasswordScreen(type: type,));
      case TestResultsScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TestResultsScreen());
      case TrainingNotesScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TrainingNotesScreen());
      case FAQScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const FAQScreen());
      case FAQDetailsScreen.tag:
        var type = routeSettings.arguments as CategoryData?;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) => FAQDetailsScreen(
                  category: type,
                ));
      case AboutScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const AboutScreen());
      case AppFounderScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const AppFounderScreen());
      case ContactScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const ContactScreen());
      case UpdatePasswordStatusScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const UpdatePasswordStatusScreen());
      case SettingsScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const SettingsScreen());
      case CurrentPlanScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const CurrentPlanScreen());
      case PrivacyScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const PrivacyScreen());
      case DeleteAccountScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const DeleteAccountScreen());
      case CurrentPerformanceScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const CurrentPerformanceScreen());
      case TrainingNotesDetailScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TrainingNotesDetailScreen());
      case NutritionTestScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const NutritionTestScreen());
      case NutritionTrainingLineIdentificationScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const NutritionTrainingLineIdentificationScreen());
      case ChooseFoodScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                ChooseFoodScreen());
      case FatPercentageScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const FatPercentageScreen());
      // case MeasurementsScreen.tag:
      //   var isNutritionTest = routeSettings.arguments as bool?;
      //   return SlideRightRoute(
      //       page: (context, animation, secondaryAnimation) =>
      //           MeasurementsScreen(isNutritionTest: (isNutritionTest ?? false)));
      case AddMeasurementsScreen.tag:
        var type = routeSettings.arguments as MeasurementsType?;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                AddMeasurementsScreen(type: type ?? MeasurementsType.addNew));
      case OutdoorTrainingsScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const OutdoorTrainingsScreen());
      case CardioEquipmentsScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const CardioEquipmentsScreen());
      case TutorialUsageScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TutorialUsageScreen());
      case NutritionListScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const NutritionListScreen());
      case NutritionDetailsScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const NutritionDetailsScreen());
      case RecipeListScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const RecipeListScreen());
      case CreateRecipeScreen.tag:
      var isEditData = routeSettings.arguments as Data;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                 CreateRecipeScreen(isEditData: isEditData));
      case FoodListScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const FoodListScreen());
      case FoodTypeScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const FoodTypeScreen());
      case SelectRecipeScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const SelectRecipeScreen());
      case RecipeDetailsScreen.tag:
       var data = routeSettings.arguments as Data;
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                 RecipeDetailsScreen(foodRecipe: data));
      case BodyMassScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const BodyMassScreen());
      case WaistHipRatioScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const WaistHipRatioScreen());
      case WaistHeightScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const WaistHeightScreen());
      case WaistCircumferenceScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const WaistCircumferenceScreen());
      case TMBAScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const TMBAScreen());
      case NutritionStrategyScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const NutritionStrategyScreen());
      case ImageViewerScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const ImageViewerScreen());
      case MeasurementHistoryScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const MeasurementHistoryScreen());
      case ChooseDatesScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const ChooseDatesScreen());
      case MeasurementsComparisonScreen.tag:
        return SlideRightRoute(
            page: (context, animation, secondaryAnimation) =>
                const MeasurementsComparisonScreen());
      default:
        return null;
    }
  }
  void dispose() {}
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget Function(BuildContext, Animation, Animation) page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
