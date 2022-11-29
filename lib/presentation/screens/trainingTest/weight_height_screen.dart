import 'package:fit_tech/presentation/screens/dialogue/test_result_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/measurements_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/about_goal_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class WeightHeightScreen extends StatelessWidget {
  static const String tag = "weight_height_screen";
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

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
                        Constants.weightHeightScreenTitle,
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
                              child: TextFieldPrimary(
                                title: Constants.weightHeightScreenWeightLabel1,
                                isLabelRequired: true,
                                isObscure: false,
                                controller: weightController,
                                keyboardType: TextInputType.number,
                                suffix: StatefulBuilder(
                                    builder: (context, myState) {
                                      return InkWell(
                                          onTap: () {
                                            showDialogue(
                                                context: context,
                                                category: TestResult.weight,
                                                selectedUnit: (unit1 == 'Kg')?0:1,
                                                onSetValue: (value){
                                                  if (value is String) {
                                                    weightController.text = value;
                                                  }
                                                },
                                                onChange: (value) {
                                                  if (value is String) {
                                                    myState((){
                                                      unit1 = value;
                                                    });
                                                  }
                                                });
                                          },
                                          child: Text(unit1));
                                    }),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        )
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
                              child: TextFieldPrimary(
                                title: Constants.weightHeightScreenWeightLabel2,
                                isLabelRequired: true,
                                isObscure: false,
                                controller: heightController,
                                keyboardType: TextInputType.number,
                                suffix: StatefulBuilder(
                                    builder: (context, myState) {
                                  return InkWell(
                                      onTap: () {
                                        showDialogue(
                                            context: context,
                                            category: TestResult.height,
                                            selectedUnit: ((unit2 == 'cm'))?0:1,
                                            onSetValue: (value){
                                              if (value is String) {
                                                heightController.text = value;
                                              }
                                            },
                                            onChange: (value) {
                                              if (value is String) {
                                                myState((){
                                                  unit2 = value;
                                                });
                                              }
                                            });
                                      },
                                      child: Text(unit2));
                                }),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        )
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
                child: PrimaryButton(
                  title: Constants.weightHeightScreenContinueLabel,
                  backgroundColor: MyColors.blackColor,
                  textColor: MyColors.whiteColor,
                  onPressed: () {
                    Navigator.pushNamed(context, AboutGoalScreen.tag);
                  },
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
      int? selectedUnit
      }) {
    showModalBottomSheet<void>(
      context: context,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.8),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
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
