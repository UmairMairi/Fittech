import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../about/privacy_policy_screen.dart';
import '../about/terms_conditions_screen.dart';
import 'family_history_screen.dart';
import 'test_after_training_screen.dart';

class FinishingTrainingTestScreen extends StatelessWidget {
  static const String tag = "finishing_training_test_screen";

  const FinishingTrainingTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel1,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel2,
          info: Constants.physicalActivityScreenInfo2),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel3,
          info: Constants.physicalActivityScreenInfo3),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel4,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel5,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel6,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel7,),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            SizedBox(
              height: 65.0,
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
                      Constants.finishingTrainingTestScreenTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
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
            const LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: MyColors.lightGreyColor,
              value: 0.9,
              valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        Constants.finishingTrainingTestScreenTitle2,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading2,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      const Text(
                        Constants.finishingTrainingTestScreenInfo1,
                        style: MyTextStyle.paragraph1,
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                              color: MyColors.extraLightGreyColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.warning,color: MyColors.redColor,),
                                  const SizedBox(width: 10,),
                                  Text(
                                    Constants.finishingTrainingTestScreenRecorderLabel,
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.heading3.copyWith(color: MyColors.redColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                               Constants.finishingTrainingTestScreenRecorderInfo1,
                                textAlign: TextAlign.start,
                                style: MyTextStyle.paragraph1.copyWith(color: MyColors.greyColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Seleccionaste',
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.paragraph1,
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(
                                    'GYM',
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.heading3.copyWith(color: MyColors.redColor),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 20,),
                      PrimaryButton(
                        title: Constants.finishingTrainingTestScreenTakeTestLabel,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                        onPressed: () {
                          Navigator.pushNamed(context, TestAfterScreen.tag);
                        },
                      ),
                      const SizedBox(height: 20,),
                      PrimaryButton(
                        title: Constants.finishingTrainingTestScreenContinueLabel,
                        backgroundColor: MyColors.whiteColor,
                        textColor: MyColors.blackColor,
                        borderColor: MyColors.blackColor,
                        onPressed: () {
                          // Navigator.pushNamed(context, ExerciseScreen.tag);
                        },
                      ),
                      const SizedBox(height: 20,),
                    ],
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
