import 'dart:async';
import 'package:fit_tech/logic/excercise/gym_excercise_provider.dart';
import 'package:fit_tech/logic/excercise/rest_between_series_provider.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreakBetweenSeriesScreen extends StatefulWidget {
  const BreakBetweenSeriesScreen({super.key});

  static const String tag = "break_between_series_screen";

  @override
  State<BreakBetweenSeriesScreen> createState() => _BreakBetweenSeriesScreenState();
}

class _BreakBetweenSeriesScreenState extends State<BreakBetweenSeriesScreen> {


  @override
  void initState() {
    super.initState();
    context.read<BreakBetweenSeriesProvider>().startTimer();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<BreakBetweenSeriesProvider>(context);
    var gymProvider = Provider.of<GymExerciseProvider>(context);
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
                    padding: const EdgeInsets.all(10.0),
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
                          Builder(
                            builder: (context) {
                              var duration = context.watch<BreakBetweenSeriesProvider>().myDuration;
                              if(duration.inSeconds<=0){
                                context.read<BreakBetweenSeriesProvider>().resetTimer();
                                Navigator.pop(context);
                              }
                              return Text(MyUtils.printDuration(duration: duration),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'Anton',
                                    color: MyColors.whiteColor,
                                    fontSize: 59.0),
                              );
                            }
                          ),
                          const  SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "(${gymProvider.currentSet}/${gymProvider.totalSets})",
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
