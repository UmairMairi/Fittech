import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

import 'medical_history_screen.dart';

class PhysicalActivityScreen extends StatelessWidget {
  static const String tag = "physical_activity_screen";

  const PhysicalActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      ChooseTrainingModeModel(title: Constants.physicalActivityScreenLabel1, info: Constants.physicalActivityScreenInfo1),
      ChooseTrainingModeModel(title: Constants.physicalActivityScreenLabel2, info: Constants.physicalActivityScreenInfo2),
      ChooseTrainingModeModel(title: Constants.physicalActivityScreenLabel3, info: Constants.physicalActivityScreenInfo3),
      ChooseTrainingModeModel(title: Constants.physicalActivityScreenLabel4, info: Constants.physicalActivityScreenInfo4),
      ChooseTrainingModeModel(title: Constants.physicalActivityScreenLabel5, info: Constants.physicalActivityScreenInfo5),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                      Constants.physicalActivityScreenTitle,
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
                      Constants.physicalActivityScreenTitle2,
                      textAlign: TextAlign.start,
                      style: MyTextStyle.heading2,
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
                                    style: MyTextStyle.heading3,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    list[index].info??"",
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.paragraph1.copyWith(color: MyColors.greyColor),
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
            const SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: PrimaryButton(
                title: Constants.physicalActivityScreenContinueLabel,
                backgroundColor: MyColors.blackColor,
                textColor: MyColors.whiteColor,
                onPressed: (){
                  Navigator.pushNamed(context, MedicalHistoryScreen.tag);
                },
              ),
            ),
            const SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: PrimaryButton(
                title: Constants.physicalActivityScreenContinueLaterLabel,
                backgroundColor: MyColors.whiteColor,
                textColor: MyColors.blackColor,
                borderColor: MyColors.blackColor,
                onPressed: (){
                  // Navigator.pushNamed(context, PhysicalActivityScreen.tag);
                },
              ),
            ),
            const SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
