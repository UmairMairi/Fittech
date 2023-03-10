import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_status_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'heart_beat_counter_screen.dart';

class HeartRateScreen extends StatelessWidget {
  static const String tag = "heart_rate_screen";

  const HeartRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyAppBar(title: Constants.heartRateScreenTitle,),
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
                      Constants.heartRateScreenTitle2,
                      textAlign: TextAlign.start,
                      style: MyTextStyle.heading2,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    const Text(
                      Constants.heartRateScreenTitle2Info1,
                      textAlign: TextAlign.start,
                      style: MyTextStyle.paragraph1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    const SizedBox(height: 20,),
                    PrimaryButton(
                      title: Constants.heartRateScreenFrequencyLabel,
                      backgroundColor: MyColors.blackColor,
                      textColor: MyColors.whiteColor,
                      borderColor: MyColors.blackColor,
                      onPressed: (){
                        Navigator.pushNamed(context, HeartBeatCounterScreen.tag);
                      },
                    ),
                    const SizedBox(height: 10,),
                    PrimaryButton(
                      title: Constants.heartRateScreenContinueLaterLabel,
                      backgroundColor: MyColors.whiteColor,
                      textColor: MyColors.blackColor,
                      borderColor: MyColors.blackColor,
                      onPressed: (){
                        Navigator.pushNamed(context, HeartStatusScreen.tag);
                      },
                    ),
                    const SizedBox(height: 20,),
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
