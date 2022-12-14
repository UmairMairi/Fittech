import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/cardio_equipments_screen.dart';
import 'package:fit_tech/presentation/screens/excersice/gym_exercise_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/presentation/widgets/today_workout_home.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

import 'warmup_screen.dart';

class TodayTrainingScreen extends StatefulWidget {
  final int index;
  const TodayTrainingScreen({super.key,this.index = 0});

  static const String tag = "today_training_screen";

  @override
  State<TodayTrainingScreen> createState() => _TodayTrainingScreenState();
}

class _TodayTrainingScreenState extends State<TodayTrainingScreen>
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
    _controller!.index = widget.index;
    _controller?.addListener(() {
      selectedIndex = _controller!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const MyAppBar(title: Constants.titleVerifyCodeScreen,),
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
                            style: MyTextStyle.inputTitle.copyWith(color: MyColors.blackColor)),
                      );
                    }).toList(),
                    controller: _controller!,
                    indicatorColor: Colors.black,
                    padding: EdgeInsets.zero,
                    labelStyle: const TextStyle(fontSize: 12.0),
                    onTap: (index){
                      if(index == 1){
                        Navigator.pushNamed(context, GymScreen.tag);
                      }else if(index == 2){
                        Navigator.pushNamed(context, OutdoorScreen.tag);
                      }
                    },
                  ),
                  const TodayWorkoutHome()
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PrimaryButton(
                title: Constants.beginLabelTestimonial,
                textColor: MyColors.whiteColor,
                backgroundColor: MyColors.redColor,
                borderColor: Colors.transparent,
                onPressed: () {
                  if(_controller!.index == 0){
                    Navigator.pushNamed(context, HeatingScreen.tag);
                  }else if(_controller!.index == 1){
                    Navigator.pushNamed(context, CardioEquipmentsScreen.tag);
                  }else{
                    Navigator.pushNamed(context, GymExerciseScreen.tag);
                  }

                },
              ),
            ),
            const SizedBox(height: 20,)

          ],
        ),
      ),
    );
  }


}
