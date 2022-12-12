import 'package:fit_tech/logic/weight_height_provider.dart';
import 'package:fit_tech/presentation/screens/dialogue/test_result_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/measurements_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/about_goal_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightHeightScreen extends StatelessWidget {
  static const String tag = "weight_height_screen";
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String weight = "";
  String height = "";

  WeightHeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var unit1 = "Kg";
    var unit2 = "ft";
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppBar(title: Constants.weightHeightScreenTitle),
              const LinearProgressIndicator(
                minHeight: 5,
                backgroundColor: MyColors.lightGreyColor,
                value: 0.3,
                valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      Constants.weightHeightScreenTitle2,
                      textAlign: TextAlign.start,
                      style: MyTextStyle.heading2,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      Constants.weightHeightScreenTitle2Info,
                      textAlign: TextAlign.start,
                      style: MyTextStyle.paragraph1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Constants.weightHeightScreenWeightLabel1,
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.inputTitle
                                        .copyWith(color: MyColors.greyColor),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  StatefulBuilder(builder: (context, myState) {
                                    return InkWell(
                                      onTap: () {
                                        showDialogue(
                                            context: context,
                                            category: TestResult.weight,
                                            selectedUnit:
                                                (unit1 == 'Kg') ? 0 : 1,
                                            onSetValue: (value) {
                                              if (value is String) {
                                                myState(() {
                                                  weight = value;
                                                  context.read<WeightHeightProvider>().setWeight(val: weight);
                                                });
                                              }
                                            },
                                            onChange: (value) {
                                              if (value is String) {
                                                myState(() {
                                                  unit1 = value;
                                                });
                                              }
                                            });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              weight,
                                              style: MyTextStyle.paragraph1,
                                            )),
                                            Text(
                                              unit1,
                                              style: MyTextStyle.paragraph1,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                  Container(
                                    height: 1,
                                    color: MyColors.greyMediumColor,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: TextFieldPrimary(
                        //         title: Constants.weightHeightScreenWeightLabel1,
                        //         isLabelRequired: true,
                        //         isObscure: false,
                        //         isEnabled: false,
                        //         controller: weightController,
                        //         keyboardType: TextInputType.number,
                        //         suffix: StatefulBuilder(
                        //             builder: (context, myState) {
                        //           return InkWell(
                        //               onTap: () {
                        //                 showDialogue(
                        //                     context: context,
                        //                     category: TestResult.weight,
                        //                     selectedUnit:
                        //                         (unit1 == 'Kg') ? 0 : 1,
                        //                     onSetValue: (value) {
                        //                       if (value is String) {
                        //                         weightController.text = value;
                        //                       }
                        //                     },
                        //                     onChange: (value) {
                        //                       if (value is String) {
                        //                         myState(() {
                        //                           unit1 = value;
                        //                         });
                        //                       }
                        //                     });
                        //               },
                        //               child: Text(unit1));
                        //         }),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: Container(),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Constants.weightHeightScreenWeightLabel2,
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.inputTitle
                                        .copyWith(color: MyColors.greyColor),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  StatefulBuilder(builder: (context, myState) {
                                    return InkWell(
                                      onTap: () {
                                        showDialogue(
                                            context: context,
                                            category: TestResult.height,
                                            selectedUnit:
                                                ((unit2 == 'cm')) ? 0 : 1,
                                            onSetValue: (value) {
                                              if (value is String) {
                                                myState(() {
                                                  height = value;
                                                  context.read<WeightHeightProvider>().setHeight(val: height);
                                                });
                                              }
                                            },
                                            onChange: (value) {
                                              if (value is String) {
                                                myState(() {
                                                  unit2 = value;
                                                });
                                              }
                                            });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              height,
                                              style: MyTextStyle.paragraph1,
                                            )),
                                            Text(
                                              unit2,
                                              style: MyTextStyle.paragraph1,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                  Container(
                                    height: 1,
                                    color: MyColors.greyMediumColor,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: TextFieldPrimary(
                        //         title: Constants.weightHeightScreenWeightLabel2,
                        //         isLabelRequired: true,
                        //         isObscure: false,
                        //         isEnabled: false,
                        //         controller: heightController,
                        //         keyboardType: TextInputType.number,
                        //         suffix: StatefulBuilder(
                        //             builder: (context, myState) {
                        //           return InkWell(
                        //               onTap: () {
                        //                 showDialogue(
                        //                     context: context,
                        //                     category: TestResult.height,
                        //                     selectedUnit:
                        //                         ((unit2 == 'cm')) ? 0 : 1,
                        //                     onSetValue: (value) {
                        //                       if (value is String) {
                        //                         heightController.text = value;
                        //                       }
                        //                     },
                        //                     onChange: (value) {
                        //                       if (value is String) {
                        //                         myState(() {
                        //                           unit2 = value;
                        //                         });
                        //                       }
                        //                     });
                        //               },
                        //               child: Text(unit2));
                        //         }),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: Container(),
                        //     ),
                        //   ],
                        // )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Builder(
                  builder: (context) {
                    var bloc = context.watch<WeightHeightProvider>();
                    bool isEnabled = false;
                    if((bloc.weight!=null && bloc.height!=null && bloc.weight!.isNotEmpty && bloc.height!.isNotEmpty)||Singleton.isDev){
                      isEnabled = true;
                    }
                    return PrimaryButton(
                      title: Constants.weightHeightScreenContinueLabel,
                      backgroundColor: MyColors.blackColor,
                      textColor: MyColors.whiteColor,
                      enabled: isEnabled,
                      onPressed: () {
                        if(height.isNotEmpty && weight.isNotEmpty && isEnabled){
                          Navigator.pushNamed(context, AboutGoalScreen.tag);
                        }
                      },
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showDialogue(
      {required BuildContext context,
      required TestResult category,
      ValueChanged<dynamic>? onChange,
      ValueChanged<dynamic>? onSetValue,
      int? selectedUnit}) {
    showModalBottomSheet<void>(
      context: context,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TestResultsDialogue(
            category: category,
            onChange: onChange,
            onSetValue: onSetValue,
            selectedUnit: selectedUnit,
          ),
        );
      },
      isScrollControlled: true,
    );
  }
}
