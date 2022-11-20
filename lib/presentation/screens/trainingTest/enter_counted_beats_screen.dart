import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/about_goal_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_beat_counter_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_status_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class EnterCountedBeatsScreen extends StatelessWidget {
  static const String tag = "counted_beats_screen";

  const EnterCountedBeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                      Constants.enterCountedBeatsScreenTitle,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading3,
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
              value: 0.8,
              valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      Constants.enterCountedBeatsScreenTitle2,
                      textAlign: TextAlign.start,
                      style: MyTextStyle.heading2,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        children: [
                          const Expanded(
                            child: TextFieldPrimary(
                              title: Constants.enterCountedBeatsScreenBeatsLabel,
                              isLabelRequired: true,
                              isObscure: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Expanded(child: Container(),),
                        ],
                      )
                    ],),
                  ],
                ),
              ),
            ),
            const SizedBox(height:20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: PrimaryButton(
                title: Constants.enterCountedBeatsScreenContinueLabel,
                backgroundColor: MyColors.blackColor,
                textColor: MyColors.whiteColor,
                onPressed: (){
                  Navigator.pushNamed(context, HeartStatusScreen.tag);
                },
              ),
            ),
            const SizedBox(height:10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: PrimaryButton(
                title: Constants.enterCountedBeatsScreenTryAgainLabel,
                backgroundColor: MyColors.whiteColor,
                textColor: MyColors.blackColor,
                onPressed: (){
                  Navigator.pushNamed(context, HeartBeatCounterScreen.tag);
                },
              ),
            ),
            const SizedBox(height:20.0),
          ],
        ),
      ),
    );
  }
}
