import 'package:fit_tech/data/models/subscription_plans_tile_model.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/nutrition_line_identification.dart';
import 'package:fit_tech/presentation/screens/trainingTest/choose_training_mode_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class NutritionTestScreen extends StatelessWidget {
  const NutritionTestScreen({super.key});

  static const String tag = "nutrition_test_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.blackColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.width,
              width: size.width,
              child: Image.asset(
                Images.trainingTestScreenBanner,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: size.width,
                    width: size.width
                  ),
                  Container(
                    decoration: const BoxDecoration(gradient: MyColors.blackGradiant2),
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Constants.nutritionTestScreenTitle,
                          textAlign: TextAlign.start,
                          style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text:TextSpan(
                              text: Constants.nutritionTestScreenInfo1,
                              style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "${Constants.nutritionTestScreenInfo2}.",
                                    style: MyTextStyle.paragraph1.copyWith(color: MyColors.redColor),),
                                TextSpan(
                                    text:
                                        "${Constants.nutritionTestScreenInfo3}.",
                                    style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor)),
                              ]),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InfoChecks(
                          title: Constants.nutritionTestScreenInfo4,
                          richTextChild: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: Constants.nutritionTestScreenInfo4,
                                style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                      "${Constants.nutritionTestScreenInfo5}.",
                                      style: MyTextStyle.paragraph1.copyWith(color: MyColors.redColor)),
                                ]),
                          ),
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            title: Constants.nutritionTestScreenStartButton,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.redColor,
                            onPressed: () {
                              Navigator.pushNamed(context, NutritionTrainingLineIdentificationScreen.tag);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color:
                      MyColors.whiteColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: MyColors.blackColor,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
