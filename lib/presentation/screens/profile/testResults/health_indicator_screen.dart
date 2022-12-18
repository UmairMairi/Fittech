import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/body_mass_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/nutrition_stategy_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/tmba_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/weist_circumference_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/weist_height_screen.dart';
import 'package:fit_tech/presentation/screens/profile/verify_identity_screen.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'weist_hip_ratio_screen.dart';

class HealthIndicatorsScreen extends StatefulWidget {
  const HealthIndicatorsScreen({super.key});

  static const String tag = "health_indicator_screen";

  @override
  State<HealthIndicatorsScreen> createState() => _HealthIndicatorsScreenState();
}

class _HealthIndicatorsScreenState extends State<HealthIndicatorsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.profileScreenAboutIcon,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          Constants.healthIndicatorScreenTitle1,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "Bajo",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, BodyMassScreen.tag);
                  },
                ),
                const Divider()
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.profileScreenAboutIcon,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          Constants.healthIndicatorScreenTitle2,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Obesidad Mórbida",
                            textAlign: TextAlign.end,
                            style: MyTextStyle.paragraph1
                                .copyWith(color: MyColors.greyColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, WaistHipRatioScreen.tag);
                  },
                ),
                const Divider()
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.profileScreenAboutIcon,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          Constants.healthIndicatorScreenTitle3,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Obesidad Mórbida",
                            textAlign: TextAlign.end,
                            style: MyTextStyle.paragraph1
                                .copyWith(color: MyColors.greyColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, WaistHeightScreen.tag);
                  },
                ),
                const Divider()
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.profileScreenAboutIcon,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          Constants.healthIndicatorScreenTitle4,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "62 cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, WaistCircumferenceScreen.tag);
                  },
                ),
                const Divider()
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.profileScreenAboutIcon,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          Constants.healthIndicatorScreenTitle5,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, TMBAScreen.tag);
                  },
                ),
                const Divider()
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.profileScreenAboutIcon,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          Constants.healthIndicatorScreenTitle6,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, NutritionStrategyScreen.tag);
                  },
                ),
                const Divider(
                  color: Colors.transparent,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
