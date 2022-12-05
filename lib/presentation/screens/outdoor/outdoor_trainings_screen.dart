import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class OutdoorTrainingsScreen extends StatefulWidget {
  const OutdoorTrainingsScreen({super.key});

  static const String tag = "outdoor_training_screen";

  @override
  State<OutdoorTrainingsScreen> createState() => _OutdoorTrainingsScreenState();
}

class _OutdoorTrainingsScreenState extends State<OutdoorTrainingsScreen> {
  var list = [
    "Correr - Run",
    "Bici - Bike",
    "Jump rope",
  ];
  var list2 = [
    "Enfoque inferior",
    "Enfoque superior",
    "Enfoque Full Body",
  ];

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
                      Constants.outdoorTrainingScreenTitle,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading3,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: MyColors.blackColor,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.asset(Images.outdoorTrainingsScreenBanner1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            const Text(
                              Constants.outdoorTrainingScreenHeading1,
                              style: MyTextStyle.heading1,
                            ),
                            const SizedBox(height: 10,),
                            ListView.builder(
                                itemCount: list.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: MyColors.greyMediumColor,
                                            size: 18,
                                          ),
                                          title: Text(
                                            list[index],
                                            style: MyTextStyle.heading3
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          minLeadingWidth: 0.0,
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                TodayTrainingScreen.tag,
                                                arguments: 2);
                                          },
                                          tileColor:
                                              MyColors.extraLightGreyColor,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(Images.outdoorTrainingsScreenBanner1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            const Text(
                              Constants.outdoorTrainingScreenHeading2,
                              style: MyTextStyle.heading1,
                            ),
                            const SizedBox(height: 10,),
                            ListView.builder(
                                itemCount: list2.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: MyColors.greyMediumColor,
                                            size: 18,
                                          ),
                                          title: Text(
                                            list2[index],
                                            style: MyTextStyle.heading3
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          minLeadingWidth: 0.0,
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                TodayTrainingScreen.tag,
                                                arguments: 2);
                                          },
                                          tileColor:
                                              MyColors.extraLightGreyColor,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
