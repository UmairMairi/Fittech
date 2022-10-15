import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../about/privacy_policy_screen.dart';
import '../about/terms_conditions_screen.dart';
import 'enter_counted_beats_screen.dart';

class HeartBeatCounterScreen extends StatelessWidget {
  static const String tag = "heart_beat_counter_screen";

  const HeartBeatCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                Expanded(
                  child: Container(),
                ),],
            ),
            const LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: Colors.transparent,
              value: 0.2,
              valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: MyColors.redColor,width: 5.0)
                  ),
                  child: const Text("10",
                    style: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 42,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: PrimaryButton(
                title: Constants.heartRateScreenFrequencyLabel,
                backgroundColor: MyColors.redColor,
                textColor: MyColors.whiteColor,
                borderColor: MyColors.redColor,
                onPressed: (){
                  Navigator.pushNamed(context, EnterCountedBeatsScreen.tag);
                },
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
