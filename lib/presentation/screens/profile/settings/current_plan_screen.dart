import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/verify_identity_screen.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrentPlanScreen extends StatefulWidget {
  const CurrentPlanScreen({super.key});

  static const String tag = "current_plan_screen";

  @override
  State<CurrentPlanScreen> createState() => _CurrentPlanScreenState();
}

class _CurrentPlanScreenState extends State<CurrentPlanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:MyColors.extraLightGreyColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: MyColors.whiteColor,
                child: Column(
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
                              Constants.currentPlanScreenTitle,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Plan Gratuito",
                                    style: MyTextStyle.heading2,
                                  ),
                                  Text(
                                    "Vence el 07/07/2022",
                                    style: MyTextStyle.paragraph1,
                                  )
                                ],
                              )),
                          Image.asset(
                            Images.currentPlanScreenIcon1,
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                color: MyColors.whiteColor,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        Constants.currentPlanScreenLabel1,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading3
                            .copyWith(color: MyColors.blackColor),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [

                                      Expanded(
                                          child: Text(
                                        "Plan Gratuito",
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color: MyColors.blackColor),
                                      )),
                                      Text(
                                        "07/06/2022",
                                        textAlign: TextAlign.end,
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color: MyColors.greyColor),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              if(index!=4)
                                const Divider()
                            ],
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
