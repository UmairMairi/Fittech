import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/weight_height_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class BiologicalGenderScreen extends StatelessWidget {
  static const String tag = "biological_gender_screen";

  const BiologicalGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      ChooseTrainingModeModel(
          title: Constants.biologicalGenderScreenLabel1,
          info: Constants.biologicalGenderScreenInfo1),
      ChooseTrainingModeModel(
          title: Constants.biologicalGenderScreenLabel2,
          info: Constants.biologicalGenderScreenInfo2),
    ];
    var currentSelectedItem = -1;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                      Constants.biologicalGenderScreenTitle,
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
            const LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: MyColors.lightGreyColor,
              value: 0.2,
              valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        Constants.biologicalGenderScreenTitle2,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading2,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        Constants.biologicalGenderScreenTitle2Info,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.paragraph1,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      StatefulBuilder(builder: (context, myState) {
                        return ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                myState(() {
                                  currentSelectedItem = index;
                                });
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: (currentSelectedItem == index)
                                          ? MyColors.redColor
                                          : MyColors.extraLightGreyColor),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index].title,
                                        textAlign: TextAlign.start,
                                        style: MyTextStyle.heading3.copyWith(
                                            color:
                                                (currentSelectedItem == index)
                                                    ? MyColors.whiteColor
                                                    : MyColors.blackColor),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        list[index].info ?? "",
                                        textAlign: TextAlign.start,
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color:
                                                (currentSelectedItem == index)
                                                    ? MyColors.whiteColor
                                                    : MyColors.greyColor),
                                      ),
                                    ],
                                  )),
                            );
                          },
                        );
                      }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      PrimaryButton(
                        title: Constants.chooseTrainingModeContinueLabel,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                        onPressed: () {
                          Navigator.pushNamed(context, WeightHeightScreen.tag);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
