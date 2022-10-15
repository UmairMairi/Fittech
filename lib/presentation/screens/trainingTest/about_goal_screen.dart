import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/physical_activity_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class AboutGoalScreen extends StatelessWidget {
  static const String tag = "about_goal_screen";

  const AboutGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      ChooseTrainingModeModel(
          title: Constants.aboutGoalScreenLabel1,
          info: Constants.aboutGoalScreenInfo1),
      ChooseTrainingModeModel(
          title: Constants.aboutGoalScreenLabel2,
          info: Constants.aboutGoalScreenInfo2),
      ChooseTrainingModeModel(
          title: Constants.aboutGoalScreenLabel3,
          info: Constants.aboutGoalScreenInfo3),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    Constants.aboutGoalScreenTitle,
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
            const LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: Colors.transparent,
              value: 0.2,
              valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      Constants.aboutGoalScreenTitle2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 28.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                  color: MyColors.lightGreyColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index].title,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.blackColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    list[index].info??"",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.greyColor,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PrimaryButton(
                title: Constants.chooseTrainingModeContinueLabel,
                backgroundColor: MyColors.blackColor,
                textColor: MyColors.whiteColor,
                onPressed: (){
                  Navigator.pushNamed(context, PhysicalActivityScreen.tag);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
