import 'package:fit_tech/presentation/screens/dialogue/food_dialogue.dart';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/create_recipe_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/presentation/widgets/today_workout_home.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class FoodTypeScreen extends StatefulWidget {
  const FoodTypeScreen({super.key});

  static const String tag = "food_type_screen";

  @override
  State<FoodTypeScreen> createState() => _FoodTypeScreenState();
}

class _FoodTypeScreenState extends State<FoodTypeScreen>
    with TickerProviderStateMixin {
  var selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  var list = {
    "Manzana",
    "Manzana mediana"
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: Column(
          children: [
            Container(
              color: MyColors.whiteColor,
              child: SizedBox(
                height: 65.0,
                child: Column(
                  children: [
                    Row(
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
                            Constants.titleFoodTypeScreen,
                            textAlign: TextAlign.start,
                            style: MyTextStyle.text1,
                          ),
                        ),
                        Opacity(
                          opacity: 0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline_outlined,
                              color: MyColors.blackColor,
                              size: 24.0,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, CreateRecipeScreen.tag);
                            },
                          ),
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: Container(
                  color: MyColors.whiteColor,
                  child: ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          showDialogue(context: context);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5.0),
                                  child: Text(
                                    "Alimento 1",
                                    style: MyTextStyle.text1,
                                  ),
                                ),
                                if(index != (list.length-1))
                                  const Divider()
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogue({required BuildContext context}) {
    showModalBottomSheet<bool?>(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const FoodDialogue(),
          );
        }).then((val) {
      if ((val is bool) && (val == true)) {
        Navigator.pop(context);
      }
    });
  }
}
