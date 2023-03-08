import 'dart:developer';

import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/measurements_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class TestResultsDialogue extends StatefulWidget {
  final TestResult category;
  final ValueChanged<dynamic>? onChange;
  final ValueChanged<dynamic>? onSetValue;
  final int? selectedUnit;
  final String? initialValue;

  const TestResultsDialogue(
      {super.key,
      this.category = TestResult.weight,
      this.onChange,
      this.onSetValue,
      this.initialValue,
      this.selectedUnit = 0});

  @override
  State<TestResultsDialogue> createState() => _TestResultsDialogueState();
}

class _TestResultsDialogueState extends State<TestResultsDialogue> {
  final TextEditingController controller = TextEditingController();
  var unit = "";

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue ?? "";
    selected = widget.selectedUnit;
    print(selected);
    if (widget.category == TestResult.weight ) {
      if(selected == 0){
      unit = "kg";
      }else{
      unit = "lb";
      }
    } else {
       if(selected == 0){
      unit = "cm";
      }else{
      unit = "in";
      if(widget.category == TestResult.height){
      unit = "ft";
      }
      }
      // unit = "cm";
    }
    // debugger();
  }

  var selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: MyColors.whiteColor),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  getName(widget.category),
                  textAlign: TextAlign.start,
                  style:
                      MyTextStyle.heading3.copyWith(color: MyColors.blackColor),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: MyColors.blackColor,
                  size: 20,
                ),
                constraints:
                    const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
              )
            ],
          ),
          if (widget.category != TestResult.weight)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  getImage(cat: widget.category),
                ),
                Text(
                  '*De pies a cabeza.',
                  style: MyTextStyle.style
                      .copyWith(color: MyColors.greyColor, fontSize: 12),
                ),
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: TextFieldPrimary(
                      isLabelRequired: true,
                      title: getName(widget.category),
                      isObscure: false,
                      controller: controller,
                      onChanged: (val) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {}
                        return null;
                      },
                      keyboardType: TextInputType.number),
                ),
                (widget.category == TestResult.weight)
                    ? StatefulBuilder(builder: (context, myState) {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                myState(() {
                                  selected = 0;
                                    unit = "kg";
                                  if (widget.onChange != null) {
                                    widget.onChange!("kg");
                                  }
                                });
                                // Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                    color: (selected == 0)
                                        ? MyColors.blackColor
                                        : MyColors.whiteColor,
                                    border: Border.all(
                                        color: MyColors.blackColor, width: 1)),
                                child: Text(
                                  'Kg',
                                  style: MyTextStyle.style.copyWith(
                                      color: (selected == 0)
                                          ? MyColors.whiteColor
                                          : MyColors.blackColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                myState(() {
                                  selected = 1;
                                  unit = "lb";
                                  if (widget.onChange != null) {
                                    widget.onChange!("lb");
                                  }
                                  // debugger();
                                });
                                // Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                    color: (selected == 1)
                                        ? MyColors.blackColor
                                        : MyColors.whiteColor,
                                    border: Border.all(
                                        color: MyColors.blackColor, width: 1)),
                                child: Text(
                                  'lb',
                                  style: MyTextStyle.style.copyWith(
                                      color: (selected == 1)
                                          ? MyColors.whiteColor
                                          : MyColors.blackColor),
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                    : StatefulBuilder(builder: (context, myState) {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                myState(() {
                                  selected = 0;
                                  unit = "cm";
                                  if (widget.onChange != null) {
                                    widget.onChange!("cm");
                                  }
                                });
                                // Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                    color: (selected == 0)
                                        ? MyColors.blackColor
                                        : MyColors.whiteColor,
                                    border: Border.all(
                                        color: MyColors.blackColor, width: 1)),
                                child: Text(
                                  'cm',
                                  style: MyTextStyle.style.copyWith(
                                      color: (selected == 0)
                                          ? MyColors.whiteColor
                                          : MyColors.blackColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                myState(() {
                                  unit = (widget.category == TestResult.height)
                                      ? 'ft'
                                      : 'in';
                                  selected = 1;

                                  if (widget.onChange != null) {
                                    widget.onChange!(
                                        (widget.category == TestResult.height)
                                            ? 'ft'
                                            : 'in');
                                  }
                                });
                                // Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                    color: (selected == 1)
                                        ? MyColors.blackColor
                                        : MyColors.whiteColor,
                                    border: Border.all(
                                        color: MyColors.blackColor, width: 1)),
                                child: Text(
                                  (widget.category == TestResult.height)
                                      ? 'ft'
                                      : 'in',
                                  style: MyTextStyle.style.copyWith(
                                      color: (selected == 1)
                                          ? MyColors.whiteColor
                                          : MyColors.blackColor),
                                ),
                              ),
                            ),
                          ],
                        );
                      })
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  title: Constants.ProfileDialogueButtonCancel,
                  backgroundColor: MyColors.whiteColor,
                  textColor: Colors.black,
                  borderColor: MyColors.blackColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PrimaryButton(
                  enabled: controller.text.isNotEmpty,
                  title: Constants.ProfileDialogueButtonSave,
                  backgroundColor: MyColors.blackColor,
                  textColor: MyColors.whiteColor,
                  borderColor: MyColors.blackColor,
                  onPressed: () {
                    print(unit);
                    if (widget.onSetValue != null) {
                      widget.onSetValue!("${controller.text}$unit");
                      Navigator.pop(context);
                    }
                    // debugger();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  getName(TestResult cat) {
    if (cat == TestResult.weight) {
      return Constants.testResultDialogueTitle1;
    } else if (cat == TestResult.height) {
      return Constants.testResultDialogueTitle2;
    } else if (cat == TestResult.minWaist) {
      return Constants.testResultDialogueTitle3;
    } else if (cat == TestResult.maxWaist) {
      return Constants.testResultDialogueTitle4;
    } else if (cat == TestResult.hip) {
      return Constants.testResultDialogueTitle5;
    } else if (cat == TestResult.neck) {
      return Constants.testResultDialogueTitle6;
    } else if (cat == TestResult.middleThigh) {
      return Constants.testResultDialogueTitle7;
    } else if (cat == TestResult.arm) {
      return Constants.testResultDialogueTitle8;
    } else if (cat == TestResult.chest) {
      return Constants.testResultDialogueTitle9;
    }
  }

  getImage({required TestResult cat}) {
    if (cat == TestResult.height) {
      return Images.testResultDialogueHeight;
    } else if (cat == TestResult.minWaist) {
      return Images.testResultDialogueMinWaist;
    } else if (cat == TestResult.maxWaist) {
      return Images.testResultDialogueMaxWaist;
    } else if (cat == TestResult.hip) {
      return Images.testResultDialogueHip;
    } else if (cat == TestResult.neck) {
      return Images.testResultDialogueNeck;
    } else if (cat == TestResult.middleThigh) {
      return Images.testResultDialogueMiddleThigh;
    } else if (cat == TestResult.arm) {
      return Images.testResultDialogueArm;
    } else if (cat == TestResult.chest) {
      return Images.testResultDialogueChest;
    }
  }
}
