import 'package:fit_tech/presentation/screens/trainingTest/about_goal_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class WeightHeightScreen extends StatelessWidget {
  static const String tag = "weight_height_screen";

  const WeightHeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                minHeight: 8,
                backgroundColor: Colors.transparent,
                value: 0.2,
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
                            const Expanded(
                              child: TextFieldPrimary(
                                title: Constants.weightHeightScreenWeightLabel1,
                                isLabelRequired: true,
                                isObscure: false,
                                keyboardType: TextInputType.number,
                                suffixText: "Kg.",
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
                            const Expanded(
                              child: TextFieldPrimary(
                                title: Constants.weightHeightScreenWeightLabel2,
                                isLabelRequired: true,
                                isObscure: false,
                                keyboardType: TextInputType.number,
                                suffixText: "cm.",
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
}
