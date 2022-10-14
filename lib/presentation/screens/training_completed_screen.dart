import 'package:fit_tech/presentation/screens/dialogue/dialogue_pause.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TrainingCompletedScreen extends StatefulWidget {
  const TrainingCompletedScreen({super.key});

  static const String tag = "complete_training_screen";

  @override
  State<TrainingCompletedScreen> createState() =>
      _TrainingCompletedScreenState();
}

class _TrainingCompletedScreenState extends State<TrainingCompletedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: size.width * 0.8,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      child: Image.asset(
                        Images.trainingCompletedScreenBanner,
                        fit: BoxFit.cover,
                        height: size.width,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          Constants.trainingCompletedScreenInfo,
                          style: TextStyle(
                              fontFamily: 'Open Sance',
                              color: MyColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          Constants.trainingCompletedScreenTitle,
                          style: TextStyle(
                              fontFamily: 'Anton',
                              color: MyColors.whiteColor,
                              fontSize: 42.0),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration:
                              const BoxDecoration(color: MyColors.whiteColor),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "12",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Open Sance',
                                          color: MyColors.blackColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      Constants
                                          .trainingCompletedScreenExerciseLabel,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Open Sance',
                                          color: MyColors.blackColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )),
                              Container(
                                height: 30,
                                width: 0.5,
                                color: MyColors.greyColor,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "250.5",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Open Sance',
                                          color: MyColors.blackColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      Constants.trainingCompletedScreenKclLabel,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Open Sance',
                                          color: MyColors.blackColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )),
                              Container(
                                height: 30,
                                width: 0.5,
                                color: MyColors.greyColor,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "15:35",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Open Sance',
                                          color: MyColors.blackColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      Constants
                                          .trainingCompletedScreenDurationLabel,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Open Sance',
                                          color: MyColors.blackColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(color: MyColors.whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Constants.trainingCompletedScreenReviewLabel,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Open Sance',
                        color: MyColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              Constants.trainingCompletedScreenReview1,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  color: MyColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.circle_outlined))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              Constants.trainingCompletedScreenReview2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  color: MyColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.circle_outlined))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              Constants.trainingCompletedScreenReview3,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  color: MyColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.circle_outlined))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              Constants.trainingCompletedScreenReview4,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  color: MyColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.circle_outlined))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              Constants.trainingCompletedScreenReview5,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  color: MyColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.circle_outlined))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(color: MyColors.whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        Constants.trainingCompletedScreenWeekLabel,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0),
                      ),
                      Expanded(child: Container()),
                      const Text(
                        Constants.trainingCompletedScreenSeeMore,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.redColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    Constants.trainingCompletedScreenRoutineLabel,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Open Sance',
                        color: MyColors.greyColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    daysOfWeekVisible: true,
                    weekNumbersVisible: false,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


