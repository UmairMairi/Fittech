import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
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
              style: TextStyle(
                  fontFamily: 'Open Sance',
                  color: MyColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              Constants.todayWorkoutSubInfo1,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Open Sance',
                  color: MyColors.blackColor,
                  fontSize: 16.0,
                  height: 1.5),
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
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              Constants.todayWorkoutSubTitle2,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Open Sance',
                  color: MyColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
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
                        children: const [
                          Text(
                            "Intermedio",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Nivel",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0),
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
                        children: const [
                          Text(
                            "≈150.5",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Kcal",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0),
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
                        children: const [
                          Text(
                            "9 min",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Duración",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0),
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
              style: TextStyle(
                  fontFamily: 'Open Sance',
                  color: MyColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
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
                                    style: TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  Text(
                                    "00:24",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.redColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            )),
                        IconButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(5.0),
                            constraints: const BoxConstraints(
                                minHeight: 0.0, minWidth: 0.0),
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ))
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