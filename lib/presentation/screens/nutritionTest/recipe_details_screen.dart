import 'package:fit_tech/data/models/nutritions_list_model.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/create_recipe_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';

import '../../../data/models/recipe/recipe_list_model.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key,this.foodRecipe});

  static const String tag = "recipe_details_screen";
  final Data? foodRecipe;

  @override
  State<RecipeDetailsScreen> createState() => _MyNutritionDetailsScreenState();
}

class _MyNutritionDetailsScreenState extends State<RecipeDetailsScreen> {
  
  final TextEditingController emailController =
      TextEditingController(text: Singleton.isDev ? "Desayuno ligero" : "");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(title: Constants.titleRecipeDetailsScreen),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("${widget.foodRecipe!.name}",style: MyTextStyle.inputTitle,),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    Constants.label1RecipeDetailsScreen,
                    style: MyTextStyle.heading3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        Constants.label1Value1RecipeDetailsScreen,
                        style: MyTextStyle.inputMessage
                            .copyWith(color: MyColors.greyColor),
                      ),
                      Expanded(child: Container()),
                      Text(
                        Constants.label1Value2RecipeDetailsScreen,
                        style: MyTextStyle.inputMessage
                            .copyWith(color: MyColors.greyColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: widget.foodRecipe!.foodRecipie!.length,
                      itemBuilder: (context, index) {
                        FoodRecipie foodItem =  widget.foodRecipe!.foodRecipie![index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                 Text(
                                  "${foodItem.food!.name}",
                                  style: MyTextStyle.text1,
                                ),
                                Expanded(child: Container()),
                                 Text(
                                  "${foodItem.quantity}",
                                  style: MyTextStyle.text1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider()
                          ],
                        );
                      }),
                )
              ],
            )),
            const SizedBox(
              height: 1,
            ),
            Container(
              color: MyColors.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Inf. Nutricional",
                        style: MyTextStyle.heading3,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Expanded(
                        child: Text("${widget.foodRecipe!.totalCalorie} kcal", style: MyTextStyle.text1),
                      ),
                      Expanded(
                        child: Text(
                          "P. ${widget.foodRecipe!.totalProtien}g",
                          style: MyTextStyle.text1,
                        ),
                      ),
                      Expanded(
                        child: Text("C. ${widget.foodRecipe!.totalCarbs}g", style: MyTextStyle.text1),
                      ),
                      Expanded(
                        child: Text("G. ${widget.foodRecipe!.totalFats}g", style: MyTextStyle.text1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.editTitleRecipeDetailsScreen,
                      textColor: MyColors.blackColor,
                      backgroundColor: MyColors.whiteColor,
                      onPressed: () {
                        Navigator.pushNamed(context, CreateRecipeScreen.tag,arguments: widget.foodRecipe );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
