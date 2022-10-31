import 'package:fit_tech/data/models/subscription_plans_tile_model.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class SubscribePlanScreen extends StatelessWidget {
  SubscribePlanScreen({super.key});

  static const String tag = "subscribe_plan_screen";
  static const list = [1, 2, 3];
  static List<SubscriptionPlansTileModel> list2 = [
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle1,
        gratis: "7 días",
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle2,
        gratis: "1 receta",
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle3,
        gratis: false,
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle4,
        gratis: false,
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle5,
        gratis: false,
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle6,
        gratis: false,
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle7,
        gratis: false,
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle8,
        gratis: false,
        fitTechPlus: true),
    SubscriptionPlansTileModel(
        title: Constants.subscribePlanScreenTileTitle9,
        gratis: false,
        fitTechPlus: true),
  ];
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
                  Container(
                    height: size.width / 1.8,
                    width: size.width,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding:
                        const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: MyColors.whiteColor.withOpacity(0.8),
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: MyColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        const BoxDecoration(gradient: MyColors.blackGradiant),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Constants.titleSubscribePlanScreen,
                                textAlign: TextAlign.start,
                                style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                height: 180,
                                child: planItem(),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                Constants.subscribePlanScreenInfo,
                                textAlign: TextAlign.center,
                                style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          color: MyColors.blackColor,
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                    fontSize: 15,
                                    fontFamily: 'Open Sance',
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child:
                                      Text(
                                    "Gratis",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: MyColors.whiteColor,
                                      fontSize: 15,
                                      fontFamily: 'Open Sance',
                                    ),
                                  ),
                                ),),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "FITTECH",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                    fontSize: 15,
                                    fontFamily: 'Open Sance',
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: list2.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 60,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                color: (index % 2 == 0)
                                    ? MyColors.greyColor
                                    : MyColors.blackColor,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        list2[index].title,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: MyColors.whiteColor,
                                          fontSize: 15,
                                          fontFamily: 'Open Sance',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: (list2[index].gratis is bool)
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: const BoxDecoration(
                                                    color: MyColors.whiteColor,
                                                    shape: BoxShape.circle),
                                                child: Icon(
                                                  Icons.close,
                                                  size: 15,
                                                  color: (index % 2 == 0)
                                                      ? MyColors.greyColor
                                                      : MyColors.blackColor,
                                                ),
                                              )
                                            : Text(
                                                list2[index].gratis,
                                                maxLines: 2,
                                                style: MyTextStyle.paragraph2.copyWith(color: MyColors.whiteColor),
                                              ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: (list2[index].fitTechPlus is bool)
                                          ? Container(
                                        padding:
                                        const EdgeInsets.all(5.0),
                                        decoration: const BoxDecoration(
                                            color: MyColors.redColor,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.done_rounded,
                                          size: 14,
                                          color: MyColors.whiteColor,
                                        ),
                                      )
                                          : Text(
                                        list2[index].fitTechPlus,
                                        maxLines: 2,
                                        style: MyTextStyle.paragraph2.copyWith(color: MyColors.whiteColor),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              // const InfoChecks(
                              //     title: Constants.subscribePlanScreenInfo1),
                              // const SizedBox(
                              //   height: 10.0,
                              // ),
                              // const InfoChecks(
                              //     title: Constants.subscribePlanScreenInfo2),
                              // const SizedBox(
                              //   height: 10.0,
                              // ),
                              // const InfoChecks(
                              //     title: Constants.subscribePlanScreenInfo3),
                              // const SizedBox(
                              //   height: 10.0,
                              // ),
                              // const InfoChecks(
                              //     title: Constants.subscribePlanScreenInfo4),
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
                                    Navigator.pushNamed(context, DashboardScreen.tag);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: PrimaryButton(
                                  title: Constants.gratisLabel,
                                  textColor: MyColors.whiteColor,
                                  backgroundColor: MyColors.blackColor,
                                  borderColor: MyColors.whiteColor,
                                  onPressed: () {},
                                ),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height:1,color: MyColors.whiteColor,),
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
    return StatefulBuilder(builder: (context, myState) {
      return Row(
        children: list.map((item) {
          var index = list.indexOf(item);
          return Expanded(
              child: GestureDetector(
            onTap: () {
              myState(() {
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
                        color: (currentIndex == index)?MyColors.whiteColor:MyColors.greyColor,
                        // border: (currentIndex == index)
                        //     ? Border.all(color: Colors.white, width: 2.0)
                        //     : null
                    ),
                    padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 15.0),
                    child: Column(
                      children: [
                        Text(
                          "Plan trimestral",
                          textAlign: TextAlign.center,
                          style: MyTextStyle.paragraph2.copyWith(color: (currentIndex == index)?MyColors.blackColor:MyColors.whiteColor,fontSize: 13,),
                        ),
                        Expanded(child: Container()),
                        Center(
                            child: Text(
                          "USD 9.99",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: (currentIndex == index)?MyColors.blackColor:MyColors.whiteColor,
                              fontSize: 25,
                              fontFamily: 'Anton',),
                        )),
                        Expanded(child: Container()),
                        Text(
                          "27.000 COP x mes",
                          textAlign: TextAlign.center,
                          style: MyTextStyle.paragraph2.copyWith(color: (currentIndex == index)?MyColors.blackColor:MyColors.whiteColor,fontSize: 13,),
                        ),
                      ],
                    ),
                  ),
                  if (index == 2)
                    Container(
                      decoration: BoxDecoration(
                          color: MyColors.redColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          Constants.bestOfferLabel,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Open Sance',
                          ),
                          overflow: TextOverflow.ellipsis,

                        ),
                      ),
                    )
                ],
              ),
            ),
          ));
        }).toList(),
      );
    });
  }
}
