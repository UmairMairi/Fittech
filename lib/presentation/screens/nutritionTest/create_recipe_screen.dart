import 'package:fit_tech/logic/recipe/recipe_provider.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/food_list_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/recipe_list_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_loading.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/counter_widget.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  static const String tag = "create_recipe_screen";

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final TextEditingController inputController = TextEditingController();
  var count = 1;

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
          const MyAppBar(
            title: Constants.titleCreateRecipeScreen,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFieldPrimary(
                            isLabelRequired: true,
                            title: Constants.inputLabelCreateRecipeScreen,
                            isObscure: false,
                            keyboardType: TextInputType.emailAddress,
                            controller: inputController,
                            onChanged: (val) {
                              setState(() {});
                            },
                            validator: (val) {
                              if (val == null && val!.isEmpty) {
                                return "Se requiere campo";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Builder(builder: (context) {
                            var provider = context.watch<RecipeProvider>();
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: provider.selectedFood.length,
                                itemBuilder: (context, index) {
                                  var food = provider.selectedFood[index];
                                  return provider.selectedFood.isEmpty
                                      ? Container()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              Constants
                                                  .heading1CreateRecipeScreen,
                                              style: MyTextStyle.heading3,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  Constants.heading1CreateRecipeScreen,                                                  
                                                  style: MyTextStyle.normal
                                                      .copyWith(fontSize: 15),
                                                ),
                                                Expanded(child: Container()),
                                                Text(
                                                  Constants
                                                      .heading1Value2CreateRecipeScreen,
                                                  style: MyTextStyle.normal
                                                      .copyWith(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                 "${food.name}",
                                                  style: MyTextStyle.text1,
                                                ),
                                                Expanded(child: Container()),
                                                CounterWidget(
                                                  counter: food.quantity,                                                    
                                                  showUnit: false,
                                                )
                                              ],
                                            ),
                                            const Divider()
                                          ],
                                        );
                                });
                          }),
                          
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, FoodListScreen.tag);
                              },
                              child: Text(
                                "+ Agregar alimento",
                                style: MyTextStyle.heading3
                                    .copyWith(color: MyColors.redColor),
                              ))
                          // Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(),
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
                      Builder(builder: (context) {
                        var provider = context.watch<RecipeProvider>();
                        provider.sumCalculator();
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text("${provider.kcal} kcal",
                                  style: MyTextStyle.text1),
                            ),
                            Expanded(
                              child: Text(
                                "P. ${provider.p}g",
                                style: MyTextStyle.text1,
                              ),
                            ),
                            Expanded(
                              child: Text("C. ${provider.c}g",
                                  style: MyTextStyle.text1),
                            ),
                            Expanded(
                              child: Text("G. ${provider.g}g",
                                  style: MyTextStyle.text1),
                            ),
                          ],
                        );
                      }),
                     
                      const SizedBox(
                        height: 10,
                      ),
                      Builder(builder: (context) {
                        var provider = context.watch<RecipeProvider>();
                        if (provider.isLoading) {
                          return const LoadingButton(
                            backgroundColor: MyColors.redColor,
                            borderColor: MyColors.redColor,
                          );
                        }

                        return SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            enabled: inputController.text.isNotEmpty,
                            title: Constants.createAccountTitle,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.redColor,
                            borderColor: MyColors.redColor,
                            onPressed: () async {
                              var bloc = context.read<RecipeProvider>();
                              if (inputController.text.isEmpty) {
                                showMessage(
                                    context: context,
                                    msg: "Please! Enter Recipe Name");
                              } else {
                                var response = await bloc.addRecipe(
                                    context: context,
                                    name: inputController.text);
                                if (response != null && response['success']) {
                                  bloc.selectedFood.clear();
                                  showMessage(
                                      context: context,
                                      msg: response['message'],
                                      success: true);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(
                                      context, RecipeListScreen.tag);
                                } else {
                                  showMessage(
                                      context: context,
                                      msg: response['message']);
                                }
                              }
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
