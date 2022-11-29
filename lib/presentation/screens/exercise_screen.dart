import 'package:fit_tech/presentation/screens/breaks_screen.dart';
import 'package:fit_tech/presentation/screens/dialogue/add_note_dialogue.dart';
import 'package:fit_tech/presentation/screens/replace_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/training_completed_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  static const String tag = "exercise_screen";

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen>
    with WidgetsBindingObserver {
  var isResumed = false;
  var isUpdate = false;

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
                          const SizedBox(
                            height: 20,
                          ),
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
                          SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                backgroundColor: MyColors.redColor,
                                textColor: MyColors.whiteColor,
                                borderColor: MyColors.redColor,
                                title: isUpdate?" Listo":Constants.burpeesPauseButton,
                                leadingChild: Icon(
                                  isUpdate?Icons.done:Icons.pause,
                                  size: 20,
                                  color: MyColors.whiteColor,
                                ),
                                onPressed: () {
                                  if(isUpdate){
                                    Navigator.pushNamed(context, TrainingCompletedScreen.tag);
                                  }
                                  // if (isResumed) {
                                  //   Navigator.pushNamed(context, RestScreen.tag);
                                  // } else {
                                  //   Navigator.pushNamed(context, BreakBetweenSeriesScreen.tag).then((value){
                                  //     isResumed = true;
                                  //   });
                                  // }
                                },
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                      backgroundColor:
                                          MyColors.extraLightGreyColor,
                                      borderColor: MyColors.extraLightGreyColor,
                                      textColor: MyColors.blackColor,
                                      title: Constants.burpeesAnteriorButton,
                                      leadingChild: const Icon(
                                        Icons.skip_previous_rounded,
                                        size: 20,
                                        color: MyColors.blackColor,
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          isUpdate = true;
                                        });
                                        // Navigator.pushNamed(context, ExerciseScreen.tag);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: PrimaryButton(
                                      backgroundColor:
                                          MyColors.extraLightGreyColor,
                                      borderColor: MyColors.extraLightGreyColor,
                                      textColor: MyColors.blackColor,
                                      title: Constants.burpeesOmitButton,
                                      trailingChild: const Icon(
                                        Icons.skip_next_rounded,
                                        size: 20,
                                        color: MyColors.blackColor,
                                      ),
                                      onPressed: (){
                                        Navigator.pushNamed(context, RestScreen.tag);
                                      },
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
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              backgroundColor: MyColors.whiteColor,
                              borderColor: MyColors.greyColor,
                              textColor: MyColors.greyColor,
                              title: Constants.burpeesReplaceExcButton,
                              onPressed: (){
                                Navigator.pushNamed(context,ReplaceExerciseScreen.tag);
                              },
                            ),
                          ),
                          Expanded(
                            child: PrimaryButton(
                              backgroundColor: MyColors.whiteColor,
                              borderColor: MyColors.greyColor,
                              textColor: MyColors.greyColor,
                              title: Constants.burpeesAddNoteButton,
                              onPressed: (){
                                showDialogue(context: context);
                              },
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

  showDialogue({required BuildContext context}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddNoteDialogue(),
          );
        });
  }
}
