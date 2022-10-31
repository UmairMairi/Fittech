import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  static const String tag = "exercise_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    Images.heatingScreenBanner,
                    fit: BoxFit.cover,
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      backgroundColor: Colors.transparent,
                      value: 0.5,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(MyColors.redColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.5,
                            width: size.width,
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: MyColors.whiteColor.withOpacity(0.8),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: MyColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Text(
                            Constants.titleBurpeesScreen,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "00:30",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Anton',
                                color: MyColors.blackColor,
                                fontSize: 58.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                backgroundColor: MyColors.redColor,
                                textColor: MyColors.whiteColor,
                                borderColor: MyColors.redColor,
                                title: Constants.burpeesPauseButton,
                                leadingChild: Icon(
                                  Icons.pause,
                                  size: 20,
                                  color: MyColors.whiteColor,
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: PrimaryButton(
                                      backgroundColor: MyColors.extraLightGreyColor,
                                      borderColor: MyColors.extraLightGreyColor,
                                      textColor: MyColors.blackColor,
                                      title: Constants.burpeesAnteriorButton,
                                      leadingChild: Icon(
                                        Icons.skip_previous_rounded,
                                        size: 20,
                                        color: MyColors.blackColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: PrimaryButton(
                                      backgroundColor: MyColors.extraLightGreyColor,
                                      borderColor: MyColors.extraLightGreyColor,
                                      textColor: MyColors.blackColor,
                                      title: Constants.burpeesOmitButton,
                                      trailingChild: Icon(
                                        Icons.skip_next_rounded,
                                        size: 20,
                                        color: MyColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Expanded(
                            child: PrimaryButton(
                              backgroundColor: MyColors.whiteColor,
                              borderColor: MyColors.greyColor,
                              textColor: MyColors.greyColor,
                              title: Constants.burpeesReplaceExcButton,
                            ),
                          ),
                          Expanded(
                            child: PrimaryButton(
                              backgroundColor: MyColors.whiteColor,
                              borderColor: MyColors.greyColor,
                              textColor: MyColors.greyColor,
                              title: Constants.burpeesAddNoteButton,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
