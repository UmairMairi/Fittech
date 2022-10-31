import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/biological_gender_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class ChooseTrainingModeScreen extends StatelessWidget {
  static const String tag = "choose_training_mode_screen";

  const ChooseTrainingModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      ChooseTrainingModeModel(
          title: Constants.chooseTrainingModeScreenLabel1,
          info: Constants.chooseTrainingModeScreenInfo1),
      ChooseTrainingModeModel(
          title: Constants.chooseTrainingModeScreenLabel2,
          info: Constants.chooseTrainingModeScreenInfo2),
      ChooseTrainingModeModel(
          title: Constants.chooseTrainingModeScreenLabel3,
          info: Constants.chooseTrainingModeScreenInfo3),
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
                      Constants.chooseTrainingModeScreenTitle,
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
            ),
            const LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: MyColors.lightGreyColor,
              value: 0.1,
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
                        Constants.chooseTrainingModeScreenTitle2,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading2,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      StatefulBuilder(
                        builder: (context,myState) {
                          return ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  myState((){
                                    currentSelectedItem = index;
                                  });
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(bottom: 10.0),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(color: (currentSelectedItem == index) ?MyColors.redColor:MyColors.extraLightGreyColor),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index].title,
                                          textAlign: TextAlign.start,
                                          style: MyTextStyle.heading3.copyWith(color: (currentSelectedItem == index) ?MyColors.whiteColor:MyColors.blackColor),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          list[index].info??"",
                                          textAlign: TextAlign.start,
                                          style: MyTextStyle.paragraph1.copyWith(color: (currentSelectedItem == index) ?MyColors.whiteColor:MyColors.greyColor),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          );
                        }
                      ),
                      const SizedBox(height: 10,),
                      PrimaryButton(
                        title: Constants.chooseTrainingModeContinueLabel,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                        onPressed: (){
                          Navigator.pushNamed(context, BiologicalGenderScreen.tag);
                        },
                      ),
                      const SizedBox(height: 20,)
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
