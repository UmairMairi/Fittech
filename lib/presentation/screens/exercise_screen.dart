import 'package:fit_tech/logic/excercise/excersice_provider.dart';
import 'package:fit_tech/presentation/screens/breaks_screen.dart';
import 'package:fit_tech/presentation/screens/dialogue/add_note_dialogue.dart';
import 'package:fit_tech/presentation/screens/dialogue/dialogue_pause.dart';
import 'package:fit_tech/presentation/screens/replace_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_rate_screen.dart';
import 'package:fit_tech/presentation/screens/training_completed_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    // Provider.of<ExerciseProvider>(context,listen: false).changeType(type: 0);
    Provider.of<ExerciseProvider>(context, listen: false).startTimer();
  }

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
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.5,
                          width: size.width,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: () {
                              showDialoguePause(context: context);
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                const Expanded(
                                  child: SizedBox(
                                    height: 20,
                                  ),
                                ),
                                Builder(builder: (context) {
                                  var duration =
                                      context.watch<ExerciseProvider>().myDuration;
                                  var type = context.watch<ExerciseProvider>().type;
                                  if (type == 0) {
                                    return Text(
                                      MyUtils.printDuration(duration: duration),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontFamily: 'Anton',
                                          color: MyColors.blackColor,
                                          fontSize: 58.0),
                                    );
                                  } else {
                                    return const Text(
                                      "30x",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Anton',
                                          color: MyColors.blackColor,
                                          fontSize: 58.0),
                                    );
                                  }
                                }),
                                const Text(
                                  "Nombre de Ejercicio",
                                  textAlign: TextAlign.center,
                                  style: MyTextStyle.heading3,
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    height: 20.0,
                                  ),
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: Builder(builder: (context) {
                                      var type =
                                          context.watch<ExerciseProvider>().type;
                                      return PrimaryButton(
                                        backgroundColor: MyColors.redColor,
                                        textColor: MyColors.whiteColor,
                                        borderColor: MyColors.redColor,
                                        title: (type == 1)
                                            ? " Listo"
                                            : Constants.burpeesPauseButton,
                                        leadingChild: Icon(
                                          (type == 1) ? Icons.done : Icons.pause,
                                          size: 20,
                                          color: MyColors.whiteColor,
                                        ),
                                        onPressed: () {
                                          if (type == 1) {
                                            Navigator.pushNamed(
                                                context, TrainingCompletedScreen.tag);
                                          } else {
                                            context
                                                .read<ExerciseProvider>()
                                                .stopTimer();
                                            showDialoguePause(context: context);
                                          }
                                        },
                                      );
                                    })),
                                const SizedBox(
                                  height: 10,
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
                                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                                            leadingChild: const Icon(
                                              Icons.skip_previous_rounded,
                                              size: 20,
                                              color: MyColors.blackColor,
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<ExerciseProvider>()
                                                  .changeType(type: 1);
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: PrimaryButton(
                                            backgroundColor:
                                                MyColors.extraLightGreyColor,
                                            borderColor: MyColors.extraLightGreyColor,
                                            textColor: MyColors.blackColor,
                                            title: Constants.burpeesOmitButton,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            trailingChild: const Icon(
                                              Icons.skip_next_rounded,
                                              size: 20,
                                              color: MyColors.blackColor,
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, RestScreen.tag);
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 62.0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.greyBorderColor)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: MyColors.whiteColor,
                                borderColor: MyColors.whiteColor,
                                textColor: MyColors.greyColor,
                                title: Constants.burpeesReplaceExcButton,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ReplaceExerciseScreen.tag);
                                },
                              ),
                            ),
                            Container(height: double.infinity,width: 1,color: MyColors.greyBorderColor,),
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: MyColors.whiteColor,
                                borderColor: MyColors.whiteColor,
                                textColor: MyColors.greyColor,
                                title: Constants.burpeesAddNoteButton,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                onPressed: () {
                                  showDialogue(context: context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialoguePause({required BuildContext context}) {
    showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: DialoguePause(
              onPause: () {
                Navigator.pushNamed(context, HeartRateScreen.tag);
              },
              onRestart: () {
                Navigator.pop(context);
              },
              onExit: () {
                context.read<ExerciseProvider>().resetTimer();
                Navigator.pop(context,"exit");
              },
            ),
          );
        }).then((value) {
          if(value == "exit"){
            Navigator.pushNamed(context, TodayTrainingScreen.tag);
          }else{
            context.read<ExerciseProvider>().startTimer();
          }
    });
  }

  showDialogue({required BuildContext context}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddNoteDialogue(),
          );
        });
  }

  @override
  void dispose() {
    Provider.of<ExerciseProvider>(context, listen: false).resetTimer();
    Provider.of<ExerciseProvider>(context, listen: false).changeType(type: 0);
    super.dispose();
  }
}
