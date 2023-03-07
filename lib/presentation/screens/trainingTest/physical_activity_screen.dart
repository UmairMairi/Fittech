import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/logic/physical_activity_provider.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                      Constants.physicalActivityScreenTitle,
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
              value: 0.5,
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
                        Constants.physicalActivityScreenTitle2,
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
                                  myState(() {
                                    currentSelectedItem = index;
                                    context.read<PhysicalActivityProvider>().setSelectItem(val: list[currentSelectedItem]);
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                          list[index].info??"",
                                          textAlign: TextAlign.start,
                                          style: MyTextStyle.paragraph1.copyWith(color: (currentSelectedItem == index)
                                              ? MyColors.whiteColor
                                              : MyColors.greyColor),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          );
                        }
                      ),

                      const SizedBox(height: 20.0,),
                      Builder(
                        builder: (context) {
                          var bloc = context.watch<PhysicalActivityProvider>();
                          bool isEnabled = false;
                          if((bloc.selectedItem!=null)||Singleton.isDev){
                            isEnabled = true;
                          }
                          return PrimaryButton(
                            title: Constants.physicalActivityScreenContinueLabel,
                            backgroundColor: MyColors.blackColor,
                            textColor: MyColors.whiteColor,
                            enabled: isEnabled,
                            onPressed: (){
                              if(currentSelectedItem!=-1){
                                Navigator.pushNamed(context, MedicalHistoryScreen.tag);
                              }
                            },
                          );
                        }
                      ),
                      const SizedBox(height: 10.0,),
                      PrimaryButton(
                            title: Constants.physicalActivityScreenContinueLaterLabel,
                            backgroundColor: MyColors.whiteColor,
                            textColor: MyColors.blackColor,
                            borderColor: MyColors.blackColor,
                            onPressed: (){
                              Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.tag, (route) => false);
                            },
                          ),
                      const SizedBox(height: 20.0,),
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
