import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/toturial_usage_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/intro_screen.dart';
import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

import 'finishing_training_test_screen.dart';

class HeartStatusScreen extends StatelessWidget {
  const HeartStatusScreen({super.key, this.isNutritionTest = false});

  final bool isNutritionTest;

  static const String tag = "heart_status_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
      ),
    );
  }

  childrenList({required BuildContext context}) {
    return <Widget>[
      Expanded(child: Container()),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: MyColors.redColor, shape: BoxShape.circle),
        child: Image.asset(
          Images.heartStatusScreenHeartIcon,
          height: 50,
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
      SizedBox(
        width: double.infinity,
        child: Text(
          Constants.heartStatusScreenTitle,
          textAlign: TextAlign.center,
          style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Text(
        Constants.heartStatusScreenTitle2,
        textAlign: TextAlign.center,
        style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Expanded(child: Container()),
      SizedBox(
        width: double.infinity,
        child: PrimaryButton(
          title: isNutritionTest?Constants.heartStatusScreenFinalizeLabel:Constants.heartStatusScreenContinueLabel,
          textColor: MyColors.whiteColor,
          backgroundColor: MyColors.redColor,
          borderColor: MyColors.redColor,
          onPressed: () {
            if(isNutritionTest){
              Navigator.pushNamed(context, TutorialUsageScreen.tag);
            }else{
              Navigator.pushNamed(context, FinishingTrainingTestScreen.tag);
            }
          },
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      if (!isNutritionTest)
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: Constants.heartStatusScreenTryAgainLabel,
                textColor: MyColors.whiteColor,
                backgroundColor: MyColors.blackColor,
                borderColor: MyColors.whiteColor,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.tag, (route) => false);
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

          ],
        )
    ];
  }
}
