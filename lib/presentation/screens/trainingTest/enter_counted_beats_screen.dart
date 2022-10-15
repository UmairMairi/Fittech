import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/about_goal_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_status_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class EnterCountedBeatsScreen extends StatelessWidget {
  static const String tag = "counted_beats_screen";

  const EnterCountedBeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
            const LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: Colors.transparent,
              value: 0.2,
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
                      style: TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 28.0),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text(
                        Constants.enterCountedBeatsScreenBeatsLabel,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontSize: 18.0),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
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
            const SizedBox(height:20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: PrimaryButton(
                title: Constants.enterCountedBeatsScreenTryAgainLabel,
                backgroundColor: MyColors.whiteColor,
                textColor: MyColors.blackColor,
                onPressed: (){
                  // Navigator.pushNamed(context, HeartStatusScreen.tag);
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
