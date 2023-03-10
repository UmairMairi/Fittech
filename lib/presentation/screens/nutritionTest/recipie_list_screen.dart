import 'package:fit_tech/presentation/screens/nutritionTest/create_recipe_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/recipe_details_screen.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  static const String tag = "recipe_list_screen";

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen>
    with TickerProviderStateMixin {
  var selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

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
                      Constants.titleRecipeListScreen,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading3,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: MyColors.blackColor,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, CreateRecipeScreen.tag);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Desayuno ligero",
                              style: MyTextStyle.medium.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  height: 1.5),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const Text("4 ingredients",
                                    style: MyTextStyle.inputTitle),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, RecipeDetailsScreen.tag);
                                  },
                                  child: Text(
                                    "Ver receta",
                                    style: MyTextStyle.paragraph1.copyWith(fontWeight: FontWeight.bold,color: MyColors.redColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Text("245 kcal",
                                      style: MyTextStyle.paragraph1),
                                ),
                                Expanded(
                                  child: Text("P. 102g",
                                      style: MyTextStyle.paragraph1),
                                ),
                                Expanded(
                                  child: Text("C. 27g",
                                      style: MyTextStyle.paragraph1),
                                ),
                                Expanded(
                                  child: Text("G. 21g",
                                      style: MyTextStyle.paragraph1),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(height: 10.0,)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
