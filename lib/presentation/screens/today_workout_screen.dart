import 'package:fit_tech/presentation/screens/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/gym_screen.dart';
import 'package:fit_tech/presentation/screens/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/outdoor_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/presentation/widgets/today_workout_home.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class TodayWorkoutScreen extends StatefulWidget {
  const TodayWorkoutScreen({super.key});

  static const String tag = "today_workout_screen";

  @override
  State<TodayWorkoutScreen> createState() => _TodayWorkoutScreenState();
}

class _TodayWorkoutScreenState extends State<TodayWorkoutScreen>
    with TickerProviderStateMixin {
  List<String>? tabNames;
  List<Widget>? tabWidgets;
  TabController? _controller;
  var selectedIndex = 0;
  var tabSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabNames = ["Home", "Gym", "Outdoor"];
    tabWidgets = [const TodayWorkoutHome(), Container(), Container()];
    _controller = TabController(length: tabNames!.length, vsync: this);
    _controller!.addListener(() {
      if (_controller!.index == 1) {
        Navigator.pushNamed(context, GymScreen.tag);
      } else if (_controller!.index == 2) {
        Navigator.pushNamed(context, OutdoorScreen.tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              shrinkWrap: true,
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
                    const Expanded(
                      child: Text(
                        Constants.titleVerifyCodeScreen,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
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
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(
                      fontFamily: 'Open Sance',
                      color: MyColors.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                  tabs: tabNames!.map((item) {
                    return Tab(
                      height: 30.0,
                      child: Text(item,
                          style: const TextStyle(
                              fontFamily: 'Open Sance',
                              color: MyColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                    );
                  }).toList(),
                  controller: _controller!,
                  indicatorColor: Colors.black,
                  padding: EdgeInsets.zero,
                  labelStyle: const TextStyle(fontSize: 12.0),
                ),
                const TodayWorkoutHome()
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PrimaryButton(
                title: Constants.beginLabelTestimonial,
                textColor: MyColors.whiteColor,
                backgroundColor: MyColors.redColor,
                borderColor: Colors.transparent,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
