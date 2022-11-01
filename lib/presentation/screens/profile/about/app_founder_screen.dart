import 'package:fit_tech/data/models/subscription_plans_tile_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/choose_training_mode_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class AppFounderScreen extends StatelessWidget {
  const AppFounderScreen({super.key});

  static const String tag = "app_founder_screen";

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
              height: size.width/1.5,
              width: size.width,
              child: Image.asset(
                Images.appFounderScreenBanner,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: (size.width/1.5)-50,
                        width: size.width
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
                  Container(
                    decoration: const BoxDecoration(gradient: MyColors.blackGradiant2),
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Constants.appFounderScreenTitle,
                          textAlign: TextAlign.start,
                          style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(Constants.appFounderScreenInfo1,style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                            child: Text(Constants.appFounderScreenTitle2,style: MyTextStyle.heading3.copyWith(color: MyColors.whiteColor),)),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            SizedBox(
                              height: size.width,
                              width: size.width,
                              child: Image.asset(
                                Images.appFounderScreenImage1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                gradient: MyColors.blackGradiant1
                              ),
                              child: Text(
                                Constants.appFounderScreenTitle3,
                                textAlign: TextAlign.start,
                                style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo2,
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo3,
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo4,
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo5,
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            SizedBox(
                              height: size.width,
                              width: size.width,
                              child: Image.asset(
                                Images.appFounderScreenImage2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  gradient: MyColors.blackGradiant1
                              ),
                              child: Text(
                                Constants.appFounderScreenTitle4,
                                textAlign: TextAlign.start,
                                style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo6,
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo7,
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo8,
                          iconColor: MyColors.redColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                          title: Constants.appFounderScreenInfo9,
                          iconColor: MyColors.redColor,
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
          ],
        ),
      ),
    );
  }
}
