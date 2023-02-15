import 'dart:async';

import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/circular_progress_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'enter_counted_beats_screen.dart';

class HeartBeatCounterScreen extends StatefulWidget {
  static const String tag = "heart_beat_counter_screen";

  const HeartBeatCounterScreen({super.key});

  @override
  State<HeartBeatCounterScreen> createState() => _HeartBeatCounterScreenState();
}

class _HeartBeatCounterScreenState extends State<HeartBeatCounterScreen> {
  Timer? countdownTimer;
  var max = 10;
  Duration myDuration = const Duration(seconds: 10);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(seconds: 10));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        Navigator.pushNamed(context, EnterCountedBeatsScreen.tag);
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

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
              child: Center(
                child: CircularProgress(
                  progress: myDuration.inSeconds.toDouble(),
                  startAnimation: (myDuration.inSeconds.toDouble()-1),
                  maxLength: max.toDouble(),
                  child: Center(
                    child: Text("${myDuration.inSeconds}",
                      style: MyTextStyle.heading1,
                      ),
                  ),
                  ),
                ),
              ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Builder(
                builder: (context) {
                  return PrimaryButton(
                    title: "Iniciar",
                    backgroundColor: MyColors.redColor,
                    textColor: MyColors.whiteColor,
                    borderColor: MyColors.redColor,
                    enabled: countdownTimer == null,
                    onPressed: (){
                      startTimer();
                    },
                  );
                }
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
