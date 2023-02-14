import 'package:fit_tech/data/models/nutritions_list_model.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/create_recipe_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key});

  static const String tag = "recipe_details_screen";

  @override
  State<RecipeDetailsScreen> createState() => _MyNutritionDetailsScreenState();
}

class _MyNutritionDetailsScreenState extends State<RecipeDetailsScreen> {
  List<NutritionListModel> list = [];
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
              child: TextFieldPrimary(
                isLabelRequired: true,
                title: Constants.inputTitleRecipeDetailsScreen,
                isObscure: false,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {},
                validator: (val) {
                  if (val == null && val!.isEmpty) {
                    return "El correo ingresado no está registrado";
                  } else {
                    return null;
                  }
                },
              ),
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
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Manana",
                                  style: MyTextStyle.text1,
                                ),
                                Expanded(child: Container()),
                                const Text(
                                  "300gr",
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
                    children: const [
                      Expanded(
                        child: Text("245 kcal", style: MyTextStyle.text1),
                      ),
                      Expanded(
                        child: Text(
                          "P. 102g",
                          style: MyTextStyle.text1,
                        ),
                      ),
                      Expanded(
                        child: Text("C. 27g", style: MyTextStyle.text1),
                      ),
                      Expanded(
                        child: Text("G. 21g", style: MyTextStyle.text1),
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
                        Navigator.pushNamed(context, CreateRecipeScreen.tag);
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
