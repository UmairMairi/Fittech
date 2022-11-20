import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/today_workout_home.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class TodayTrainingScreen extends StatefulWidget {
  const TodayTrainingScreen({super.key});

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

    // _controller?.addListener(() {
    //   if(_controller?.index == 1){
    //     Navigator.pushNamed(context, GymScreen.tag);
    //   }else if(_controller?.index == 2){
    //     print("Move to outdoor screen");
    //   }
    // });
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
                            style: MyTextStyle.inputTitle.copyWith(color: MyColors.blackColor)),
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
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20,)

          ],
        ),
      ),
    );
  }
}
