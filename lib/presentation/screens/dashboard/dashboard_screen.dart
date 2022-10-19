import 'package:fit_tech/data/models/my_plans_list_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String tag = "dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<MyPlansListModel> list = [];
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    list.add(MyPlansListModel(
        image: Images.myPlansScreenGymBanner,
        title: "Home",
        quantity: "12 ejercicios",
        duration: "15 minutos"));
    list.add(MyPlansListModel(
        image: Images.myPlansScreenHomeBanner,
        title: "Gym",
        quantity: "12 ejercicios",
        duration: "15 minutos"));
    list.add(MyPlansListModel(
        image: Images.myPlansScreenOutdoorBanner,
        title: "Outdoor",
        quantity: "12 ejercicios",
        duration: "15 minutos"));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              child: Stack(
                fit: StackFit.loose,
                children: [
                  AspectRatio(
                    aspectRatio: 0.9,
                    child: Container(
                      alignment: Alignment.topCenter,
                      color: MyColors.blackColor,
                      margin: EdgeInsets.only(bottom: size.width * 0.2),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 65.0,
                          child: Text(
                            Constants.myPlanScreenTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Anton',
                                color: MyColors.whiteColor,
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          Constants.myPlanScreenInfo,
                          style: MyTextStyle.heading3
                              .copyWith(color: MyColors.whiteColor),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "4",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    Constants
                                        .trainingCompletedScreenExerciseLabel,
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.paragraph1
                                        .copyWith(color: MyColors.whiteColor),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "4150.5",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    Constants.trainingCompletedScreenKclLabel,
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.paragraph1
                                        .copyWith(color: MyColors.whiteColor),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "15:35",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Open Sance',
                                        color: MyColors.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    Constants
                                        .trainingCompletedScreenDurationLabel,
                                    textAlign: TextAlign.start,
                                    style: MyTextStyle.paragraph1
                                        .copyWith(color: MyColors.whiteColor),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          decoration:
                              const BoxDecoration(color: MyColors.redColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                Constants.myPlanScreenCurrentTextTitle,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.whiteColor),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                Constants.myPlanScreenCurrentTextInfo,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: MyColors.whiteColor),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              PrimaryButton(
                                title: Constants.myPlanScreenContinueTestTitle,
                                backgroundColor: MyColors.blackColor,
                                borderColor: MyColors.blackColor,
                                textColor: MyColors.whiteColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(color: MyColors.blackColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    Constants.myPlanScreenTutorialTitle,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: MyColors.whiteColor),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    Constants.myPlanScreenTutorialInfo,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: MyColors.whiteColor),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  PrimaryButton(
                    title: Constants.myPlanScreenWatchTutorialTitle,
                    backgroundColor: MyColors.redColor,
                    borderColor: MyColors.redColor,
                    textColor: MyColors.whiteColor,
                  )
                ],
              ),
            ),
            ListView.builder(
                itemCount: list.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AspectRatio(
                        aspectRatio: 3 / 1.5,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              color: MyColors.blackColor,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Image.asset(
                                list[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        list[index].title,
                                        style: MyTextStyle.style.copyWith(
                                          color: MyColors.whiteColor,
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
                                      Text(
                                        list[index].quantity,
                                        style: MyTextStyle.paragraph1.copyWith(
                                          color: MyColors.whiteColor,
                                        ),
                                      ),
                                      const Text(
                                        " • ",
                                        style: TextStyle(
                                            color: MyColors.whiteColor),
                                      ),
                                      Text(
                                        list[index].duration,
                                        style: MyTextStyle.paragraph1.copyWith(
                                          color: MyColors.whiteColor,
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
                })
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: MyTextStyle.style.copyWith(
            color: MyColors.redColor,
            fontSize: 13,
          ),
          unselectedLabelStyle: MyTextStyle.style.copyWith(
            color: MyColors.blackColor,
            fontSize: 13,
          ),
          unselectedItemColor: MyColors.blackColor,
          selectedItemColor: MyColors.redColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.planUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.planChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Mi plan",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.nutritionUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.nutritionChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Nutrición",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.storeUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.storeUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Tienda",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.profileUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.profileChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Mi cuenta",
            ),
          ],
        ),
      ),
    );
  }
}
