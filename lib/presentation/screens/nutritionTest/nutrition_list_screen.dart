import 'package:fit_tech/data/models/my_plans_list_model.dart';
import 'package:fit_tech/data/models/nutritions_list_model.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/nutrition_details_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class NutritionListScreen extends StatefulWidget {
  const NutritionListScreen({super.key});

  static const String tag = "nutrition_list_screen";

  @override
  State<NutritionListScreen> createState() => _MyNutritionDetailsScreenState();
}

class _MyNutritionDetailsScreenState extends State<NutritionListScreen> {
  List<NutritionListModel> list = [];

  @override
  void initState() {
    super.initState();
    list.add(NutritionListModel(
      image: Images.nutritionDetailsScreenBanner1,
      title: "Desayuno",
    ));
    list.add(NutritionListModel(
      image: Images.nutritionDetailsScreenBanner2,
      title: "Almuerzo",
    ));
    list.add(NutritionListModel(
      image: Images.nutritionDetailsScreenBanner3,
      title: "Cena",
    ));

    list.add(NutritionListModel(
      image: Images.nutritionDetailsScreenBanner4,
      title: "Snack",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 65.0,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Lunes 22 Ago",
                      textAlign: TextAlign.start,
                      style: MyTextStyle.heading2,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.help_outline_rounded,
                      color: MyColors.blackColor,
                      size: 24.0,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      color: MyColors.blackColor,
                      size: 24.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    const CircularProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.red),
                                      value: 0.25,
                                      color: Colors.grey,
                                      strokeWidth: 5.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "1500",
                                          style: MyTextStyle.paragraph1,
                                        ),
                                        Text(
                                          "kcal restant",
                                          style: MyTextStyle.paragraph2,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              Images
                                                  .nutritionDetailsScreenIcon1,
                                              height: 20,
                                              width: 20,
                                            ),
                                            // Icon(
                                            //   Icons.ac_unit,
                                            //   size: 18.0,
                                            // ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Expanded(
                                                child: Text(
                                              "Proteinas",
                                              style: MyTextStyle.text1,
                                            )),
                                            const Text(
                                              "102/200 g.",
                                              style: MyTextStyle.text1,
                                            )
                                          ],
                                        ),
                                        const LinearProgressIndicator(
                                          backgroundColor:
                                              MyColors.lightGreyColor,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.red),
                                          value: 0.5,
                                          minHeight: 3.0,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              Images
                                                  .nutritionDetailsScreenIcon2,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Expanded(
                                                child: Text(
                                              "Carbs",
                                              style: MyTextStyle.text1,
                                            )),
                                            const Text(
                                              "27/100 g.",
                                              style: MyTextStyle.text1,
                                            )
                                          ],
                                        ),
                                        const LinearProgressIndicator(
                                          backgroundColor:
                                              MyColors.lightGreyColor,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  MyColors.blackColor),
                                          value: 0.5,
                                          minHeight: 3.0,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                Images
                                                    .nutritionDetailsScreenIcon3,
                                                height: 20,
                                                width: 20),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Expanded(
                                                child: Text(
                                              "Grasas",
                                              style: MyTextStyle.text1,
                                            )),
                                            const Text(
                                              "21/78 g.",
                                              style: MyTextStyle.text1,
                                            )
                                          ],
                                        ),
                                        const LinearProgressIndicator(
                                          backgroundColor:
                                              MyColors.lightGreyColor,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  MyColors.greyColor),
                                          value: 0.5,
                                          minHeight: 3.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            itemCount: list.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, NutritionDetailsScreen.tag);
                                },
                                child: AspectRatio(
                                    aspectRatio: 3 / 1.5,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                          color: MyColors.blackColor,
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Image.asset(
                                            list[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    list[index].title,
                                                    style: MyTextStyle.style
                                                        .copyWith(
                                                      color:
                                                          MyColors.whiteColor,
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_forward_rounded,
                                                    color: MyColors.whiteColor,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "245 kcal",
                                                      style: MyTextStyle
                                                          .paragraph1
                                                          .copyWith(
                                                        color:
                                                            MyColors.whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    child: Text(
                                                      "P. 102g",
                                                      style: TextStyle(
                                                          color: MyColors
                                                              .whiteColor),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "C. 27g",
                                                      style: MyTextStyle
                                                          .paragraph1
                                                          .copyWith(
                                                        color:
                                                            MyColors.whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "G. 21g",
                                                      style: MyTextStyle
                                                          .paragraph1
                                                          .copyWith(
                                                        color:
                                                            MyColors.whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
