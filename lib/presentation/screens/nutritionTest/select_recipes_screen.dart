import 'package:fit_tech/logic/nutrition/select_recipe_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/create_recipe_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/nutrition_details_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectRecipeScreen extends StatefulWidget {
  const SelectRecipeScreen({super.key});

  static const String tag = "select_recipe_screen";

  @override
  State<SelectRecipeScreen> createState() => _SelectRecipeScreenState();
}

class _SelectRecipeScreenState extends State<SelectRecipeScreen> {
  // var list = [];

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
                  Expanded(
                    child: Container(),
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
                          margin: const EdgeInsets.only(bottom: 10.0),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Desayuno ligero",
                                    style: MyTextStyle.medium.copyWith(
                                        color: Colors.black,
                                        fontSize: 18,
                                        height: 1.5),
                                  ),
                                  Expanded(child: Container()),
                                  Builder(builder: (context) {
                                    var bloc =
                                        context.watch<SelectRecipeProvider>();
                                    return InkWell(
                                      onTap: () {
                                        bloc.setSelectItem(val: index);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: (bloc.selectedItem ==
                                                          index)
                                                      ? MyColors.redColor
                                                      : MyColors.blackColor,
                                                  width: (bloc.selectedItem ==
                                                          index)
                                                      ? 5
                                                      : 1)),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("4 ingredients",
                                      style: MyTextStyle.inputTitle),
                                  Expanded(child: Container()),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                          )),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Builder(builder: (context) {
                var bloc = context.watch<SelectRecipeProvider>();
                var isEnabled = false;
                if (bloc.selectedItem != -1) {
                  isEnabled = true;
                }
                return PrimaryButton(
                  title: "Colocar receta",
                  textColor: MyColors.whiteColor,
                  backgroundColor: MyColors.redColor,
                  borderColor: MyColors.redColor,
                  enabled: isEnabled,
                  onPressed: () {
                    Navigator.pushNamed(context, NutritionDetailsScreen.tag);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
