import 'package:fit_tech/data/models/my_plans_list_model.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class CurrentPerformanceScreen extends StatefulWidget {
  const CurrentPerformanceScreen({super.key});

  static const String tag = "current_performance_screen";

  @override
  State<CurrentPerformanceScreen> createState() => _CurrentPerformanceScreenState();
}

class _CurrentPerformanceScreenState extends State<CurrentPerformanceScreen> {
  List<MyPlansListModel> list = [];

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
                    padding: EdgeInsets.symmetric(horizontal:20.0),
                    child: Text(
                      Constants.currentPerformanceScreenLabel1,
                      style: MyTextStyle.heading3,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  Constants
                                      .trainingCompletedScreenExerciseLabel,
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
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
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
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  Constants
                                      .trainingCompletedScreenDurationLabel,
                                  textAlign: TextAlign.start,
                                  style: MyTextStyle.paragraph2,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
