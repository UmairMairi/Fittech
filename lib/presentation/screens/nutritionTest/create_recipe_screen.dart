import 'package:fit_tech/presentation/screens/nutritionTest/food_list_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/recipie_list_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/counter_widget.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  static const String tag = "create_recipe_screen";

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {

  final TextEditingController inputController = TextEditingController(text: "Desayuno ligero");


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
                              onChanged: (val){

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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(Constants.heading1CreateRecipeScreen,style: MyTextStyle.heading3,),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text(Constants.heading1Value1CreateRecipeScreen,style: MyTextStyle.normal.copyWith(fontSize: 15),),
                                    Expanded(child: Container()),
                                    Text(Constants.heading1Value2CreateRecipeScreen,style: MyTextStyle.normal.copyWith(fontSize: 15),),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    const Text(Constants.heading2CreateRecipeScreen,style: MyTextStyle.text1,),
                                    Expanded(child: Container()),
                                    CounterWidget(
                                      showUnit: false,
                                    )
                                  ],
                                ),
                                const Divider()
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, FoodListScreen.tag);
                              },
                                child: Text("+Agregar alimento",style: MyTextStyle.heading3.copyWith(color: MyColors.redColor),))
                            // Expanded(child: Container()),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(),
                        // const SizedBox(
                        //   height: 10,
                        // ),
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
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            title: Constants.createAccountTitle,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.redColor,
                            borderColor: MyColors.redColor,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RecipeListScreen.tag);
                            },
                          ),
                        ),
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
        ),
      ),
    );
  }
}
