import 'package:fit_tech/presentation/screens/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/login_welcome_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class SubscribePlanScreen extends StatelessWidget {
  SubscribePlanScreen({super.key});

  static const String tag = "subscribe_plan_screen";
  static const list = [1, 2, 3];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.width / 1.5,
              width: size.width,
              child: Image.asset(
                'assets/images/subscribe_plan_banner.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: size.width / 1.8,
                    width: size.width,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: const BoxDecoration(gradient: MyColors.blackGradiant),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Constants.titleSubscribePlanScreen,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Anton',
                              color: MyColors.whiteColor,
                              fontSize: 42.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InfoChecks(
                            title: Constants.subscribePlanScreenInfo1),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const InfoChecks(
                            title: Constants.subscribePlanScreenInfo2),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const InfoChecks(
                            title: Constants.subscribePlanScreenInfo3),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const InfoChecks(
                            title: Constants.subscribePlanScreenInfo4),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 150,
                          child: planItem(),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            title: Constants.subscribePlanLabel,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.redColor,
                            onPressed: () {
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            title: Constants.couponLabel,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.blackColor,
                            onPressed: () {},
                          ),
                        ),
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

  Widget planItem() {
    return StatefulBuilder(
      builder: (context,myState) {
        return Row(
          children: list.map((item) {
            var index = list.indexOf(item);
            return Expanded(child: GestureDetector(
              onTap: () {
                myState((){
                  currentIndex = index;

                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                          color: MyColors.greyColor,
                          border: (currentIndex == index)?Border.all(
                              color: Colors.white,
                              width: 2.0
                          ):null
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
                            "Plan trimestral",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Open Sance',
                                decoration: TextDecoration.lineThrough),
                          ),
                          Expanded(child: Container()),
                          Visibility(
                            visible: index == 0,
                            child: const Center(
                                child: Text(
                                  "¡Gratis!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Open Sance',
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const Center(
                              child: Text(
                                "x3 meses",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Open Sance',
                                    fontWeight: FontWeight.bold),
                              )),
                          Expanded(child: Container()),
                          const Text(
                            "27.000 COP x mes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Open Sance',
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ),
                    if(index == 0)
                      Container(
                        decoration: BoxDecoration(
                            color: MyColors.redColor,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            Constants.bestOfferLabel,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Open Sance',),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ));
          }).toList(),
        );
      }
    );
  }
}
