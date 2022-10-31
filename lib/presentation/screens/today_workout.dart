import 'package:fit_tech/data/models/subscription_plans_tile_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class TodayWorkoutScreen extends StatelessWidget {
  const TodayWorkoutScreen({super.key});

  static const String tag = "today_workout_screen";

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
                Images.gymScreenBanner,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Padding(padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: size.width-80,
                            width: size.width,
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: MyColors.whiteColor.withOpacity(0.8),
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
                              Text(
                                Constants.titleGymScreen,
                                textAlign: TextAlign.start,
                                style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: Constants.todayGymScreenInfo1,
                                    style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "${Constants.todayGymScreenInfo2}.",
                                        style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const InfoChecks(
                                title: Constants.gymScreenLabel1,
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
                        title: Constants.activeLabelGymScreen,
                        textColor: MyColors.whiteColor,
                        backgroundColor: MyColors.redColor,
                        onPressed: () {},
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
