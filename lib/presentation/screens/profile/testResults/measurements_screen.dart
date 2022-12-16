import 'package:fit_tech/logic/add_measurements_provider.dart';
import 'package:fit_tech/presentation/screens/dialogue/test_result_dialogue.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_status_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeasurementsScreen extends StatefulWidget {
  final bool isNutritionTest;

  const MeasurementsScreen({super.key, this.isNutritionTest = false});

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  Constants.measurementsScreenHeading1,
                  style: MyTextStyle.heading3,
                ),
              ),
              SizedBox(
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        context
                            .read<AddMeasurementsProviders>()
                            .getFrontImage();
                      },
                      child: Builder(builder: (context) {
                        var img = context
                            .watch<AddMeasurementsProviders>()
                            .frontImage;
                        return img != null
                            ? Container(
                                color: Colors.red,
                                child: Image.file(
                                  img,
                                  fit: BoxFit.cover,
                                  height: 250,
                                ),
                              )
                            : Container(
                                color: MyColors.blackColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: const BoxDecoration(
                                            color: MyColors.redColor,
                                            shape: BoxShape.circle),
                                        child: Text(
                                          "1",
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: MyColors.whiteColor),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      const Icon(
                                        Icons.camera_alt,
                                        color: MyColors.redColor,
                                        size: 30,
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        "Frontal",
                                        style: MyTextStyle.heading3.copyWith(
                                            color: MyColors.redColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      }),
                    )),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(child: Builder(builder: (context) {
                      var provider =
                          Provider.of<AddMeasurementsProviders>(context);
                      var isSelected = provider.frontImage != null;
                      return InkWell(
                        onTap: () {
                          provider.getSideImage();
                        },
                        child: (provider.sideImage != null)
                            ? Container(
                                color: Colors.red,
                                child: Image.file(
                                  provider.sideImage!,
                                  fit: BoxFit.cover,
                                  height: 250,
                                ),
                              )
                            : Container(
                                color: MyColors.blackColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: isSelected
                                                ? MyColors.redColor
                                                : MyColors.greyAccent,
                                            shape: BoxShape.circle),
                                        child: Text(
                                          "2",
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: MyColors.whiteColor),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Icon(
                                        Icons.camera_alt,
                                        color: isSelected
                                            ? MyColors.redColor
                                            : MyColors.greyAccent,
                                        size: 30,
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        "Perfil",
                                        style: MyTextStyle.heading3.copyWith(
                                            color: isSelected
                                                ? MyColors.redColor
                                                : MyColors.greyAccent,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    })),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(child: Builder(builder: (context) {
                      var provider =
                          Provider.of<AddMeasurementsProviders>(context);
                      var isSelected = ((provider.frontImage != null) &&
                          (provider.sideImage != null));
                      return InkWell(
                        onTap: () {
                          provider.getBackImage();
                        },
                        child: (provider.backImage != null)
                            ? Container(
                                color: Colors.red,
                                child: Image.file(
                                  provider.backImage!,
                                  fit: BoxFit.cover,
                                  height: 250,
                                ),
                              )
                            : Container(
                                color: MyColors.blackColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: isSelected
                                                ? MyColors.redColor
                                                : MyColors.greyAccent,
                                            shape: BoxShape.circle),
                                        child: Text(
                                          "3",
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: MyColors.whiteColor),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Icon(
                                        Icons.camera_alt,
                                        color: isSelected
                                            ? MyColors.redColor
                                            : MyColors.greyAccent,
                                        size: 30,
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        "Espalda",
                                        style: MyTextStyle.heading3.copyWith(
                                            color: isSelected
                                                ? MyColors.redColor
                                                : MyColors.greyAccent,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    })),
                  ],
                ),
              ),
            ],
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle2,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "62 kg",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle3,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "180cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle4,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "60cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  showDialogue(context: context, category: TestResult.minWaist);
                },
              ),
              const Divider()
            ],
          ),
          Column(
            children: [
              InkWell(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle5,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "60cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  showDialogue(context: context, category: TestResult.maxWaist);
                },
              ),
              const Divider()
            ],
          ),
          Column(
            children: [
              InkWell(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle6,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "60cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle7,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "60cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle8,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "60cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle9,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "60cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        Constants.measurementsScreenTitle10,
                        style: MyTextStyle.paragraph1
                            .copyWith(color: MyColors.blackColor),
                      )),
                      Text(
                        widget.isNutritionTest ? "+ Agregar" : "60cm",
                        textAlign: TextAlign.end,
                        style: MyTextStyle.paragraph1.copyWith(
                            color: widget.isNutritionTest
                                ? MyColors.redColor
                                : MyColors.greyColor),
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
            child: (widget.isNutritionTest)
                ? PrimaryButton(
                    title: Constants.measurementsScreenLabel3,
                    backgroundColor: MyColors.blackColor,
                    textColor: MyColors.whiteColor,
                    borderColor: MyColors.blackColor,
                    onPressed: () {
                      if (widget.isNutritionTest) {
                        Navigator.pushNamed(context, HeartStatusScreen.tag,
                            arguments: widget.isNutritionTest);
                      }
                    },
                  )
                : Row(
                    children: [
                      const Expanded(
                        child: PrimaryButton(
                          title: Constants.measurementsScreenLabel1,
                          backgroundColor: MyColors.blackColor,
                          textColor: MyColors.whiteColor,
                          borderColor: MyColors.blackColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: PrimaryButton(
                          title: Constants.measurementsScreenLabel2,
                          backgroundColor: MyColors.whiteColor,
                          textColor: MyColors.blackColor,
                          borderColor: MyColors.blackColor,
                          onPressed: () {},
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
  chest,
}
