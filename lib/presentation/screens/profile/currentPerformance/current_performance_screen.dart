import 'package:fit_tech/data/models/my_plans_list_model.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/datetime_extentions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fit_tech/presentation/widgets/calender/table_calendar.dart' as mc;
import 'performance_training_notes_screen.dart';

class CurrentPerformanceScreen extends StatefulWidget {
  const CurrentPerformanceScreen({super.key});

  static const String tag = "current_performance_screen";

  @override
  State<CurrentPerformanceScreen> createState() =>
      _CurrentPerformanceScreenState();
}

class _CurrentPerformanceScreenState extends State<CurrentPerformanceScreen> {
  List<MyPlansListModel> list = [];
  var selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    list.add(MyPlansListModel(
      image: Images.myPlansScreenGymBanner,
      title: "Home",
      quantity: "12 ejercicios",
      duration: "15 minutos",
      route: TodayTrainingScreen.tag,
    ));
    list.add(MyPlansListModel(
      image: Images.myPlansScreenHomeBanner,
      title: "Gym",
      quantity: "12 ejercicios",
      duration: "15 minutos",
      route: GymScreen.tag,
    ));
    list.add(MyPlansListModel(
      image: Images.myPlansScreenOutdoorBanner,
      title: "Outdoor",
      quantity: "12 ejercicios",
      duration: "15 minutos",
      route: OutdoorScreen.tag,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.lightGreyColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: MyColors.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            Constants.currentPerformanceScreenTitle,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      Constants.currentPerformanceScreenLabel1,
                      style: MyTextStyle.heading3,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "4",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              Constants.trainingCompletedScreenExerciseLabel,
                              textAlign: TextAlign.start,
                              style: MyTextStyle.paragraph2,
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "4150.5",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              Constants.trainingCompletedScreenKclLabel,
                              textAlign: TextAlign.start,
                              style: MyTextStyle.paragraph2,
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "15:35",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              Constants.trainingCompletedScreenDurationLabel,
                              textAlign: TextAlign.start,
                              style: MyTextStyle.paragraph2,
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                color: MyColors.whiteColor,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20.0),
              child: StatefulBuilder(builder: (context, myState) {
                return mc.TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: selectedDate,
                  daysOfWeekVisible: true,
                  weekNumbersVisible: false,
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
                  headerStyle: const mc. HeaderStyle(formatButtonVisible: false, titleCentered: true),
                  // headerVisible: false,
                  onDaySelected: (dateTime, dateTime2) {
                  },
                  // onDaySelected: ,
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: MyColors.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '14 ago. - 20 ago.',
                          style: MyTextStyle.heading3,
                        ),
                        Text(
                          '2 entrenamientos',
                          style: MyTextStyle.inputTitle
                              .copyWith(color: MyColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 1,
                    color: MyColors.lightGreyColor,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              Images.currentPerformanceScreenIcon1,
                              height: 76,
                              width: 76,
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "1er Entrenamiento",
                                      textAlign: TextAlign.start,
                                      style: MyTextStyle.heading3,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "6:28 p.m",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: MyTextStyle.style.copyWith(color: MyColors.blackColor,fontSize: 15,fontWeight: FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text('17 ago.',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: MyTextStyle.style.copyWith(color: MyColors.greyColor,fontSize: 15,fontWeight: FontWeight.normal),
                                                ),
                                              ],
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "12:58",
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style: MyTextStyle.style
                                                    .copyWith(
                                                        color:
                                                            MyColors.blackColor,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                'Duración',
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style: MyTextStyle.style
                                                    .copyWith(
                                                        color:
                                                            MyColors.greyColor,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "146.8",
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style: MyTextStyle.style
                                                    .copyWith(
                                                        color:
                                                            MyColors.blackColor,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                'Kcal',
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style: MyTextStyle.style
                                                    .copyWith(
                                                        color:
                                                            MyColors.greyColor,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TrainingNotesDetailScreen.tag);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                                color: MyColors.lightGreyColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  'NOTAS',
                                  style: MyTextStyle.style
                                      .copyWith(color: MyColors.blackColor),
                                )),
                                Container(
                                    padding: const EdgeInsets.all(5.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: MyColors.blackColor),
                                    child: Text(
                                      '2',
                                      style: MyTextStyle.style
                                          .copyWith(color: MyColors.whiteColor),
                                    )),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: MyColors.greyMediumColor,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 1,
                    color: MyColors.lightGreyColor,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          Images.currentPerformanceScreenIcon1,
                          height: 76,
                          width: 76,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "2do Entrenamiento",
                                  textAlign: TextAlign.start,
                                  style: MyTextStyle.heading3,
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "6:28 p.m",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: MyTextStyle.style.copyWith(color: MyColors.blackColor,fontSize: 15,fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text('17 ago.',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: MyTextStyle.style.copyWith(color: MyColors.greyColor,fontSize: 15,fontWeight: FontWeight.normal),
                                            ),
                                          ],
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "12:58",
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: MyTextStyle.style.copyWith(
                                                color: MyColors.blackColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'Duración',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: MyTextStyle.style.copyWith(
                                                color: MyColors.greyColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "146.8",
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: MyTextStyle.style.copyWith(
                                                color: MyColors.blackColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'Kcal',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: MyTextStyle.style.copyWith(
                                                color: MyColors.greyColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
