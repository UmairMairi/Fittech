import 'package:fit_tech/logic/excercise/training_completed_provider.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/dialogue/dialogue_pause.dart';
import 'package:fit_tech/presentation/screens/profile/currentPerformance/current_performance_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/calender/table_calendar.dart' as mc;
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/datetime_extentions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    var selectedDate = DateTime.now();
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: size.width * 0.72,
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
                          height: 20,
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
                              height: 1.3,
                              color: MyColors.whiteColor,
                              fontSize: 32.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
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
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Builder(builder: (context) {
                    var bloc = context.watch<TrainingCompletedProvider>();
                    return Row(
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
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  bloc.setSelected(val: 1);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (bloc.selected == 1)
                                                ? MyColors.redColor
                                                : MyColors.blackColor,
                                            width:
                                                (bloc.selected == 1) ? 5 : 2)),
                                  ),
                                ),
                              )
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
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  bloc.setSelected(val: 2);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (bloc.selected == 2)
                                                ? MyColors.redColor
                                                : MyColors.blackColor,
                                            width:
                                                (bloc.selected == 2) ? 5 : 2)),
                                  ),
                                ),
                              )
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
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  bloc.setSelected(val: 3);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (bloc.selected == 3)
                                                ? MyColors.redColor
                                                : MyColors.blackColor,
                                            width:
                                                (bloc.selected == 3) ? 5 : 2)),
                                  ),
                                ),
                              )
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
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  bloc.setSelected(val: 4);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (bloc.selected == 4)
                                                ? MyColors.redColor
                                                : MyColors.blackColor,
                                            width:
                                                (bloc.selected == 4) ? 5 : 2)),
                                  ),
                                ),
                              )
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
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  bloc.setSelected(val: 5);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (bloc.selected == 5)
                                                ? MyColors.redColor
                                                : MyColors.blackColor,
                                            width:
                                                (bloc.selected == 5) ? 5 : 2)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            fontSize: 18.0),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CurrentPerformanceScreen.tag);
                        },
                        child: const Text(
                          Constants.trainingCompletedScreenSeeMore,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Open Sance',
                              color: MyColors.redColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
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
                    height: 40,
                  ),
                  // StatefulBuilder(builder: (context, myState) {
                  //   return TableCalendar(
                  //     firstDay: DateTime.utc(2010, 10, 16),
                  //     lastDay: DateTime.utc(2030, 3, 14),
                  //     focusedDay: selectedDate,
                  //     daysOfWeekVisible: true,
                  //     weekNumbersVisible: false,
                  //     calendarFormat: CalendarFormat.week,
                  //     calendarStyle: CalendarStyle(
                  //       selectedDecoration: BoxDecoration(color: MyColors.redColor, borderRadius: BorderRadius.circular(30)),
                  //       todayDecoration: const BoxDecoration(shape: BoxShape.circle, color: MyColors.blackColor),
                  //       todayTextStyle: const TextStyle(color: Colors.white),
                  //       defaultDecoration: const BoxDecoration(shape: BoxShape.circle, color: MyColors.lightGreyColor),
                  //       weekendDecoration: const BoxDecoration(shape: BoxShape.circle, color: MyColors.lightGreyColor),
                  //     ),
                  //     calendarBuilders:CalendarBuilders(
                  //       markerBuilder: (context,dateTime,focusDateTime){
                  //         if(dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 2)) ||
                  //             dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 1))) {
                  //           return const Icon(Icons.more_horiz,color: MyColors.blackColor,);
                  //         }
                  //         else{
                  //           return null;
                  //         }
                  //       },
                  //         defaultBuilder: (context,dateTime,focusDateTime){
                  //         if(dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 2))||dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 1))) {
                  //           return Padding(
                  //             padding: const EdgeInsets.symmetric(horizontal: 5),
                  //             child: Container(
                  //               decoration: const BoxDecoration(color: MyColors.redColor,shape: BoxShape.circle),
                  //               child: Center(
                  //                 child: Text(
                  //                   dateTime.day.toString(),
                  //                   style: const TextStyle(color: MyColors.whiteColor),
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         }
                  //         else{
                  //           return null;
                  //         }
                  //       }
                  //     ),
                  //     headerStyle: const HeaderStyle(
                  //         formatButtonVisible: false, titleCentered: true),
                  //     headerVisible: false,
                  //     onDaySelected: (dateTime, dateTime2) {
                  //     },
                  //     // onDaySelected: ,
                  //   );
                  // }),

                  StatefulBuilder(builder: (context, myState) {
                    return mc.TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: selectedDate,
                      daysOfWeekVisible: true,
                      weekNumbersVisible: false,
                      calendarFormat: mc.CalendarFormat.week,
                      calendarStyle: mc.CalendarStyle(
                        selectedDecoration: BoxDecoration(color: MyColors.redColor, borderRadius: BorderRadius.circular(30)),
                        todayDecoration: const BoxDecoration(shape: BoxShape.circle, color: MyColors.blackColor),
                        todayTextStyle: const TextStyle(color: Colors.white),
                        defaultDecoration: const BoxDecoration(shape: BoxShape.circle, color: MyColors.lightGreyColor),
                        weekendDecoration: const BoxDecoration(shape: BoxShape.circle, color: MyColors.lightGreyColor),
                      ),
                      calendarBuilders:mc.CalendarBuilders(
                          markerBuilder: (context,dateTime,focusDateTime){
                            if(dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 2)) ||
                                dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 1))) {
                              return const Icon(Icons.more_horiz,color: MyColors.blackColor,);
                            }
                            else{
                              return null;
                            }
                          },
                          defaultBuilder: (context,dateTime,focusDateTime){
                            if(dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 2))||dateTime.isDateBeforeDuration(selectedDate,const Duration(days: 1))) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  decoration: const BoxDecoration(color: MyColors.redColor,shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      dateTime.day.toString(),
                                      style: const TextStyle(color: MyColors.whiteColor),
                                    ),
                                  ),
                                ),
                              );
                            }
                            else{
                              return null;
                            }
                          }
                      ),
                      headerStyle: const mc. HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      headerVisible: false,
                      onDaySelected: (dateTime, dateTime2) {
                      },
                      // onDaySelected: ,
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Builder(builder: (context) {
                var isEnabled = false;
                var bloc = context.watch<TrainingCompletedProvider>();
                if (bloc.selected != -1) {
                  isEnabled = true;
                }
                return PrimaryButton(
                  title: "Continuar",
                  backgroundColor: MyColors.blackColor,
                  textColor: MyColors.whiteColor,
                  borderColor: MyColors.blackColor,
                  enabled: isEnabled,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.tag, (route) => false);
                    // Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.tag);
                  },
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
