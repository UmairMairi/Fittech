import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../about/privacy_policy_screen.dart';
import '../about/terms_conditions_screen.dart';
import 'heart_rate_screen.dart';

class FamilyHistoryScreen extends StatelessWidget {
  static const String tag = "family_history_screen";

  const FamilyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      ChooseTrainingModeModel(title: Constants.familyHistoryScreenLabel1,),
      ChooseTrainingModeModel(title: Constants.familyHistoryScreenLabel2,),
      ChooseTrainingModeModel(title: Constants.familyHistoryScreenLabel3,),
      ChooseTrainingModeModel(title: Constants.familyHistoryScreenLabel4,),
      ChooseTrainingModeModel(title: Constants.familyHistoryScreenLabel5,),
      ChooseTrainingModeModel(title: Constants.familyHistoryScreenLabel6,),
    ];
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
                      Constants.familyHistoryScreenTitle,
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
                        Constants.familyHistoryScreenTitle2,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading2,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      const Text(
                        Constants.familyHistoryScreenTitle2Info1,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.paragraph1,
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                                  if(list[index].info!=null) Text(
                                    list[index].info??"",
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.paragraph1.copyWith(color: MyColors.greyColor),
                                  ),
                                ],
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: PrimaryButton(
                title: Constants.physicalActivityScreenContinueLabel,
                backgroundColor: MyColors.blackColor,
                textColor: MyColors.whiteColor,
                onPressed: (){
                  Navigator.pushNamed(context, HeartRateScreen.tag);
                },
              ),
            ),
            const SizedBox(height: 20,),
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
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
