import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../about/privacy_policy_screen.dart';
import '../about/terms_conditions_screen.dart';
import 'family_history_screen.dart';

class MedicalHistoryScreen extends StatelessWidget {
  static const String tag = "medical_history_screen";

  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel1,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel2, info: Constants.physicalActivityScreenInfo2),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel3, info: Constants.physicalActivityScreenInfo3),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel4,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel5,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel6,),
      ChooseTrainingModeModel(title: Constants.medicalHistoryScreenLabel7,),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    Constants.medicalHistoryScreenTitle,
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
                        Constants.medicalHistoryScreenTitle2,
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

                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                            text: "",
                            style: TextStyle(
                              fontFamily: 'Open Sance',
                                fontSize: 15.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: Constants.medicalHistoryScreenTitle2Info1,
                                  style: TextStyle(
                                      color: MyColors.blackColor)),
                              TextSpan(
                                  text: " ${Constants.medicalHistoryScreenTitle2Info2}.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.blackColor)),
                            ]),
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
                                    style: const TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.blackColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if(list[index].info!=null) Text(
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                            text: "",
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                fontSize: 15.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: Constants.medicalHistoryScreenTitle2Info3,
                                  style: TextStyle(
                                      color: MyColors.blackColor)),
                              TextSpan(
                                  text: " ${Constants.medicalHistoryScreenTitle2Info4}.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.blackColor)),
                            ]),
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
                  Navigator.pushNamed(context, FamilyHistoryScreen.tag);
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
