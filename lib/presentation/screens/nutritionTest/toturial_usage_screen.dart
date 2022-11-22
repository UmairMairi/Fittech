import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/nutrition_list_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class TutorialUsageScreen extends StatelessWidget {
  const TutorialUsageScreen({super.key, this.isNutritionTest = false});

  final bool isNutritionTest;

  static const String tag = "tutorial_usage_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: size.height > size.width
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: childrenList(context: context),
                )
              : ListView(
                  children: childrenList(context: context),
                ),
        ),
      ),
    );
  }

  childrenList({required BuildContext context}) {
    return <Widget>[
      Container(
        height: 65.0,
        color: MyColors.whiteColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: MyColors.blackColor,
                size: 24.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Expanded(
              child: Text(
                Constants.tutorialUsageScreenTitle,
                textAlign: TextAlign.center,
                style: MyTextStyle.heading3,
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: MyColors.blackColor,
                  size: 24.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      Expanded(child: Container()),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: Constants.tutorialUsageScreenButtonLabel,
            textColor: MyColors.whiteColor,
            backgroundColor: MyColors.redColor,
            borderColor: MyColors.redColor,
            onPressed: () {
              Navigator.pushNamed(context, NutritionListScreen.tag);
            },
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ];
  }
}
