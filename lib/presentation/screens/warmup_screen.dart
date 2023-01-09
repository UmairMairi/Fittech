import 'dart:async';

import 'package:fit_tech/logic/excercise/rest_between_sequence_provider.dart';
import 'package:fit_tech/presentation/screens/break_between_series_screen.dart';
import 'package:fit_tech/presentation/screens/breaks_screen.dart';
import 'package:fit_tech/presentation/screens/dialogue/dialogue_pause.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_rate_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/circular_progress_bar.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class HeatingScreen extends StatefulWidget {
  const HeatingScreen({super.key});

  static const String tag = "warmup_screen";

  @override
  State<HeatingScreen> createState() => _HeatingScreenState();
}

class _HeatingScreenState extends State<HeatingScreen> {
  Timer? countdownTimer;
  bool isCountDown = true;
  bool isStopped = false;
  bool isCompleted = false;
  var max = 3;
  Duration myDuration = const Duration(seconds: 3);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
    Navigator.pushNamed(context,
        RestScreen.tag);
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    myDuration = const Duration(seconds: 30);
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0 && isCountDown == true) {
        isCountDown = false;
        max = 30;
        resetTimer();
        startTimer();
      } else if (seconds < 0 && isCountDown == false) {
        isCompleted = true;
        countdownTimer?.cancel();
        Navigator.pushNamed(context,RestScreen.tag);
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    Images.heatingScreenBanner,
                    fit: BoxFit.cover,
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      backgroundColor: Colors.transparent,
                      value: 0.5,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(MyColors.redColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.4,
                      width: size.width,
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          if (isStopped) {
                            isStopped = false;
                            startTimer();
                          } else {
                            isStopped = true;
                            stopTimer();
                          }
                          showDialogue(context: context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: MyColors.whiteColor.withOpacity(0.8),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: MyColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      Constants.titleHeatingScreen,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading1,
                    ),
                    Expanded(
                        child: Container(
                      height: 20.0,
                    )),
                    CircularProgress(
                      maxLength: max.toDouble(),
                      progress: myDuration.inSeconds.toDouble(),
                      startAnimation: myDuration.inSeconds.toDouble()-1,
                      child: Center(
                        child: Text(
                          "${myDuration.inSeconds}",
                          textAlign: TextAlign.center,
                          style: MyTextStyle.heading1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      isCountDown
                          ? "CountDown"
                          : Constants.heatingScreenSubHeading,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Container(
                      height: 20.0,
                    )),
                    SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                          backgroundColor: MyColors.redColor,
                          textColor: MyColors.whiteColor,
                          borderColor: MyColors.redColor,
                          title: isStopped
                              ? Constants.continueLabel
                              : Constants.burpeesPauseButton,
                          enabled: !isCountDown,
                          leadingChild: Icon(
                            isStopped ? Icons.play_arrow_rounded : Icons.pause,
                            size: 20,
                            color: MyColors.whiteColor,
                          ),
                          onPressed: () {
                            if (isStopped) {
                              isStopped = false;
                              startTimer();
                            } else {
                              isStopped = true;
                              stopTimer();
                            }
                            showDialogue(context: context);
                          },
                        )
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogue({required BuildContext context}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: DialoguePause(
              onPause: () {
                Navigator.pushNamed(context, HeartRateScreen.tag);
              },
              onRestart: () {
                Navigator.pop(context);
              },
              onExit: () {
                Navigator.pop(context);
              },
            ),
          );
        }).then((value) {
      if (isStopped) {
        isStopped = false;
        startTimer();
      } else {
        isStopped = true;
        stopTimer();
      }
    });
  }
}
