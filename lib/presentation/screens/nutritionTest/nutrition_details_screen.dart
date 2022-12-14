import 'package:fit_tech/data/models/nutritions_list_model.dart';
import 'package:fit_tech/presentation/widgets/counter_widget.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class NutritionDetailsScreen extends StatefulWidget {
  const NutritionDetailsScreen({super.key});

  static const String tag = "nutrition_details_screen";

  @override
  State<NutritionDetailsScreen> createState() => _MyNutritionDetailsScreenState();
}

class _MyNutritionDetailsScreenState extends State<NutritionDetailsScreen> {
  List<NutritionListModel> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.extraLightGreyColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 1.5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      Images.nutritionDetailsScreenBanner1,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(20.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color:
                                          MyColors.whiteColor.withOpacity(0.8),
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                    color: MyColors.blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Opacity(
                              opacity: 0,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(20.0),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color:
                                            MyColors.whiteColor.withOpacity(0.8),
                                        shape: BoxShape.circle),
                                    child: PopupMenuButton<int>(
                                      constraints: const BoxConstraints(
                                          minWidth: 0.0, minHeight: 0.0),
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 1,
                                          textStyle: MyTextStyle.text1,
                                          height: 20,
                                          child: Row(
                                            children: const [
                                              Text("+ Agregar Nota")
                                            ],
                                          ),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),

                                    // child: const Icon(
                                    //   Icons.more_horiz,
                                    //   size: 20,
                                    //   color: MyColors.blackColor,
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Desayuno",
                              style: MyTextStyle.heading2
                                  .copyWith(color: MyColors.whiteColor),
                            )),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    color: MyColors.whiteColor,
                    child: Padding(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
                                              Image.asset(Images.nutritionDetailsScreenIcon1,height: 20,width: 20,),
                                              // Icon(
                                              //   Icons.ac_unit,
                                              //   size: 18.0,
                                              // ),
                                              const SizedBox(width: 10,),
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
                                              Image.asset(Images.nutritionDetailsScreenIcon2,height: 20,width: 20,),
                                              const SizedBox(width: 10,),
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
                                              Image.asset(Images.nutritionDetailsScreenIcon3,height: 20,width: 20),
                                              const SizedBox(width: 10,),

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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: MyColors.whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Alimentos",
                              style: MyTextStyle.heading3,
                            ),
                            Expanded(child: Container()),
                            const Text(
                              "Cantidad",
                              style: MyTextStyle.text1,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    color: MyColors.whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Manzana",
                              style: MyTextStyle.text1,
                            ),
                            Expanded(child: Container()),
                            const CounterWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    color: MyColors.whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Manzana",
                              style: MyTextStyle.text1,
                            ),
                            Expanded(child: Container()),
                            const CounterWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    color: MyColors.whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "+Agregar alimento",
                              style: MyTextStyle.heading3
                                  .copyWith(color: MyColors.redColor),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    color: MyColors.whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
