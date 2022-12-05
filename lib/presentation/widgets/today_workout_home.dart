import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class TodayWorkoutHome extends StatelessWidget {
  const TodayWorkoutHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
        children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 20.0,
            ),
            Text(
              Constants.todayWorkoutSubTitle1,
              textAlign: TextAlign.start,
              style: MyTextStyle.heading3,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              Constants.todayWorkoutSubInfo1,
              textAlign: TextAlign.start,
              style: MyTextStyle.paragraph1,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Constants.todayWorkoutSubTitle2,
              textAlign: TextAlign.start,
              style: MyTextStyle.heading3,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Intermedio",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: MyTextStyle.heading3.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "Nivel",
                            textAlign: TextAlign.start,
                            style: MyTextStyle.paragraph2,
                          ),
                        ],
                      ),
                    )),
                Container(
                  height: 30,
                  width: 0.5,
                  color: MyColors.greyColor,
                ),
                Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "≈150.5",
                            textAlign: TextAlign.start,
                            style: MyTextStyle.heading3.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "Kcal",
                            textAlign: TextAlign.start,
                            style: MyTextStyle.paragraph2,

                          ),
                        ],
                      ),
                    )),
                Container(
                  height: 30,
                  width: 0.5,
                  color: MyColors.greyColor,
                ),
                Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "9 min",
                            textAlign: TextAlign.start,
                            style: MyTextStyle.heading3.copyWith(fontSize: 16),

                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "Duración",
                            textAlign: TextAlign.start,
                            style: MyTextStyle.paragraph2,

                          ),
                        ],
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "${Constants.todayWorkoutSubTitle3} (12)",
              textAlign: TextAlign.start,
              style: MyTextStyle.heading3
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: MyColors.greyColor,
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Calentamiento",
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.heading3,
                                  ),
                                  Text(
                                    "00:24",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.redColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            )),
                        PopupMenuButton<int>(
                          constraints: const BoxConstraints(minWidth: 0.0,minHeight: 0.0),
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
                        // IconButton(
                        //     onPressed: () {},
                        //     constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
                        //     icon: const Icon(
                        //       Icons.more_horiz,
                        //       color: Colors.black,
                        //     ))
                      ],
                    ));
              },
            )
          ],
        ),
      ),
    ],);
  }
}
