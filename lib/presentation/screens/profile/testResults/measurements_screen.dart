import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/dialogue/test_result_dialogue.dart';
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

class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen({super.key});

  static const String tag = "measurements_screen";

  @override
  State<MeasurementsScreen> createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: MyColors.greyColor,
                  )),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      child: Container(
                    color: MyColors.greyColor,
                  )),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      child: Container(
                    color: MyColors.greyColor,
                  )),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle1,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: MyColors.blackColor,
                            fontWeight: FontWeight.bold),
                      )),
                      Text(
                        "Ver historial",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: MyColors.redColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle2,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "62 kg",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(context: context, category: TestResult.weight);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle3,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "180cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(context: context, category: TestResult.height);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle4,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "60cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(
                        context: context, category: TestResult.minWaist);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle5,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "60cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(
                        context: context, category: TestResult.maxWaist);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle6,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "60cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(context: context, category: TestResult.hip);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle7,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "60cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(context: context, category: TestResult.neck);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle8,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "60cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(
                        context: context, category: TestResult.middleThigh);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle9,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "60cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(context: context, category: TestResult.arm);
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
                        Expanded(
                            child: Text(
                          Constants.measurementsScreenTitle10,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.blackColor),
                        )),
                        Text(
                          "60cm",
                          textAlign: TextAlign.end,
                          style: MyTextStyle.paragraph1
                              .copyWith(color: MyColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialogue(context: context, category: TestResult.chest);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: const [
                  Expanded(
                    child: PrimaryButton(
                      title: Constants.measurementsScreenLabel1,
                      backgroundColor: MyColors.blackColor,
                      textColor: MyColors.whiteColor,
                      borderColor: MyColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: PrimaryButton(
                      title: Constants.measurementsScreenLabel2,
                      backgroundColor: MyColors.whiteColor,
                      textColor: MyColors.blackColor,
                      borderColor: MyColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  showDialogue({required BuildContext context, required TestResult category}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return TestResultsDialogue(category: category);
      },
      isScrollControlled: true,
    );
  }
}

enum TestResult {
  weight,
  height,
  minWaist,
  maxWaist,
  hip,
  neck,
  middleThigh,
  arm,
  chest
}
