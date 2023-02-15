import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';


class MeasurementsComparisonScreen extends StatelessWidget {
  static const String tag = "measurements_comparison_screen";

  const MeasurementsComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          children: [
            const MyAppBar(
              title: Constants.titleMeasurementsComparisonScreen,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: const Text(
                                    "29 Jul",
                                    style: MyTextStyle.heading3,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: const Text(
                                    "26 Ago",
                                    style: MyTextStyle.heading3,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Foto frontal",style: MyTextStyle.heading3,),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.backgroundColor,
                                  height: 400,
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.blackColor,
                                  height: 400,
                                )),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Foto de perfil",style: MyTextStyle.heading3,),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.backgroundColor,
                                  height: 400,
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.blackColor,
                                  height: 400,
                                )),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Foto de espalda",style: MyTextStyle.heading3,),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.backgroundColor,
                                  height: 400,
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: MyColors.blackColor,
                                  height: 400,
                                )),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Peso",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 kg",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60 kg",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "+2",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_upward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Altura",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "180 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "180cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      // const Text(
                                      //   "+2",
                                      //   style: MyTextStyle.text1,
                                      // ),
                                      // Icon(Icons.arrow_upward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Cintura mínima",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "+2",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_upward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Cintura máxima",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "+2",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_upward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Cadera",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "-3",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_downward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Cuello",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "-1",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_downward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Muslo medio",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "+2",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_upward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Brazo",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "+2",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_upward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          height: 1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical:10.0),
                          child: Text("Tórax",style: MyTextStyle.heading3,),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: MyColors.backgroundColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: const Text(
                                    "60 cm",
                                    style: MyTextStyle.text1,
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: MyColors.whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "60cm",
                                        style: MyTextStyle.text1,
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        "+2",
                                        style: MyTextStyle.text1,
                                      ),
                                      const Icon(Icons.arrow_upward)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
