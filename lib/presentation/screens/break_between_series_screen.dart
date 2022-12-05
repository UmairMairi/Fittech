import 'dart:async';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class BreakBetweenSeriesScreen extends StatefulWidget {
  final int? restType;
  const BreakBetweenSeriesScreen({super.key,this.restType = 0});

  static const String tag = "break_between_series_screen";

  @override
  State<BreakBetweenSeriesScreen> createState() => _BreakBetweenSeriesScreenState();
}

class _BreakBetweenSeriesScreenState extends State<BreakBetweenSeriesScreen> {

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 30);

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
    setState(() => myDuration = const Duration(seconds: 30));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        Navigator.pop(context);
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height * 0.5,
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
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.5,
                    width: size.width,
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration:
                          const BoxDecoration(color: MyColors.blackColor),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            Constants.breakBetweenSeriesScreenTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Anton',
                                color: MyColors.whiteColor,
                                fontSize: 32.0,),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "00:${myDuration.inSeconds}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Anton',
                                color: MyColors.whiteColor,
                                fontSize: 59.0),
                          ),
                          const  SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "(${widget.restType}/2)",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.whiteColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
