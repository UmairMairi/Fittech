import 'package:fit_tech/data/models/nutrition_training_model.dart';
import 'package:fit_tech/logic/nutrition/nutrition_line_identification_provider.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/choose_food_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/nutrition_test_model.dart';

class NutritionTrainingLineIdentificationScreen extends StatelessWidget {
  static const String tag = "nutrition_training_line_identification_screen";

  const NutritionTrainingLineIdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      NutritionTrainingModeModel(
          title: Constants.lineIdentificationScreenLabel1, info: ""),
      NutritionTrainingModeModel(
          title: Constants.lineIdentificationScreenLabel2, info: ""),
      NutritionTrainingModeModel(
          title: Constants.lineIdentificationScreenLabel3, info: ""),
      NutritionTrainingModeModel(
          title: Constants.lineIdentificationScreenLabel4, info: ""),
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
                      Constants.lineIdentificationScreenTitle1,
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
              value: 0.222,
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
                        Constants.lineIdentificationScreenTitle2,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading2,
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
                                  context.read<NutritionLineIdentificationProvider>().setSelectItem(val: list[index]);
                                });
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(bottom: 20.0),
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
                                      if (list[index].info!.isNotEmpty)
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      if (list[index].info!.isNotEmpty)
                                        Text(
                                          list[index].info ?? "",
                                          textAlign: TextAlign.start,
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: (currentSelectedItem ==
                                                          index)
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
                        height: 50,
                      ),
                      Builder(
                        builder: (context) {
                          var bloc = context.watch<NutritionLineIdentificationProvider>();
                          bool isEnabled = false;
                          if((bloc.selectedItem!=null)||Singleton.isDev){
                            isEnabled = true;
                          }
                          return PrimaryButton(
                            title: Constants.chooseTrainingModeContinueLabel,
                            backgroundColor: MyColors.blackColor,
                            textColor: MyColors.whiteColor,
                            enabled: isEnabled,
                            onPressed: () {
                              if(currentSelectedItem!=-1){
                                 GlobalState.nutritionTest =
                                        NutritionTestModel.fromJson(
                                            {"nutrition_line": bloc.selectedItem!.title});
                                Navigator.pushNamed(context, ChooseFoodScreen.tag);
                              }
                            },
                          );
                        }
                      ),
                      const SizedBox(
                        height: 20,
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
