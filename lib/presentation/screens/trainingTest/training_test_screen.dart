import 'package:fit_tech/data/models/subscription_plans_tile_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/choose_training_mode_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class TrainingTestScreen extends StatelessWidget {
  const TrainingTestScreen({super.key});

  static const String tag = "test_test_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Stack(
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: size.width,
                            width: size.width,
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                Constants.trainingTestScreenTitle,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Anton',
                                    color: MyColors.whiteColor,
                                    fontSize: 42.0),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: const TextSpan(
                                    text: Constants.trainingTestScreenInfo1,
                                    style: TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.whiteColor,
                                        fontSize: 16.0),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              "${Constants.trainingTestScreenInfo2}.",
                                          style: TextStyle(
                                              fontFamily: 'Open Sance',
                                              color: MyColors.redColor,
                                              fontSize: 16.0)),
                                      TextSpan(
                                          text:
                                              "${Constants.trainingTestScreenInfo3}.",
                                          style: TextStyle(
                                              fontFamily: 'Open Sance',
                                              color: MyColors.whiteColor,
                                              fontSize: 16.0)),
                                    ]),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              InfoChecks(
                                title: Constants.trainingTestScreenInfo4,
                                richTextChild: RichText(
                                  textAlign: TextAlign.start,
                                  text: const TextSpan(
                                      text: Constants.trainingTestScreenInfo4,
                                      style: TextStyle(
                                          fontFamily: 'Open Sance',
                                          color: MyColors.whiteColor,
                                          fontSize: 14.0),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                            "${Constants.trainingTestScreenInfo5}.",
                                            style: TextStyle(
                                                fontFamily: 'Open Sance',
                                                color: MyColors.redColor,
                                                fontSize: 14.0)),
                                      ]),
                                ),
                                iconColor: MyColors.redColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        title: Constants.trainingTestScreenStartButton,
                        textColor: MyColors.whiteColor,
                        backgroundColor: MyColors.redColor,
                        onPressed: () {
                          Navigator.pushNamed(context, ChooseTrainingModeScreen.tag);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
