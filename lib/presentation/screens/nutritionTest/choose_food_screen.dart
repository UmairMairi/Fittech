import 'package:fit_tech/data/models/nutrition_training_model.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/fat_percentage_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/biological_gender_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_chips.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class ChooseFoodScreen extends StatelessWidget {
  static const String tag = "choose_food_screen";

  ChooseFoodScreen({super.key});

  var index = 0;
  var selectedIndex = -1;
  var list = [
    "test 100",
    "test 100100",
    "test 100",
    "test 100100",
    "test 100",
    "test 100100100",
    "test 100",
    "test 100100",
    "test 100",
    "test 100100100100100",
    "test 100",
    "test 100100",
    "test 100",
    "test 100100",
    "test 1000",
    "test 100100100100100"
  ];

  @override
  Widget build(BuildContext context) {
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
                      Constants.chooseFoodScreenTitle1,
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
              value: 0.444,
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
                        Constants.chooseFoodScreenTitle2,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading2,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                              children: list.map((item) {
                            var selected = false;
                            if (selectedIndex == index) {
                              selected = true;
                            } else {
                              selected = false;
                            }
                            index++;
                            return MyChipsList(
                              item: item,
                              selected: selected,
                              currentValue: (value) {},
                            );
                          }).toList()),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      PrimaryButton(
                        title: Constants.chooseTrainingModeContinueLabel,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, FatPercentageScreen.tag);
                        },
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
