import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  static const String tag = "intro_screen";
  var list = [
    IntroModel(title: Constants.introTitle1, info: Constants.introInfo1),
    IntroModel(title: Constants.introTitle2, info: Constants.introInfo2),
    IntroModel(title: Constants.introTitle3, info: Constants.introInfo3),
  ];

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
              height: size.width / 1.5,
              width: size.width,
              child: Image.asset(
                'assets/images/subscribe_plan_banner.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: size.width / 1.8,
                          width: size.width,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: const BoxDecoration(
                              gradient: MyColors.blackGradiant),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                Constants.titleSubscribePlanScreen,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Anton',
                                    color: MyColors.whiteColor,
                                    fontSize: 42.0),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const InfoChecks(
                                  title: Constants.subscribePlanScreenInfo1),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const InfoChecks(
                                  title: Constants.subscribePlanScreenInfo2),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const InfoChecks(
                                  title: Constants.subscribePlanScreenInfo3),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const InfoChecks(
                                  title: Constants.subscribePlanScreenInfo4),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: PrimaryButton(
                                  title: Constants.continueLabelIntroScreen,
                                  textColor: MyColors.blackColor,
                                  backgroundColor: MyColors.whiteColor,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: MyColors.whiteColor,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.submitLabelIntroScreen,
                      textColor: MyColors.whiteColor,
                      backgroundColor: MyColors.blackColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
