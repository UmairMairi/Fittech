import 'package:fit_tech/logic/excercise/gym_excercise_provider.dart';
import 'package:fit_tech/presentation/screens/break_between_series_screen.dart';
import 'package:fit_tech/presentation/screens/breaks_screen.dart';
import 'package:fit_tech/presentation/screens/dialogue/add_note_dialogue.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/dialogue_pause.dart';
import 'package:fit_tech/presentation/screens/replace_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_rate_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GymExerciseScreen extends StatefulWidget {
  const GymExerciseScreen({super.key});

  static const String tag = "gym_exercise_screen";

  @override
  State<GymExerciseScreen> createState() => _GymExerciseScreenState();
}

class _GymExerciseScreenState extends State<GymExerciseScreen> {
  var isResumed = false;

  @override
  void initState() {
    super.initState();
    context.read<GymExerciseProvider>().setCurrentSet(val: 1);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<GymExerciseProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height * 0.4,
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
                            height: size.height * 0.4,
                            width: size.width,
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:20.0),
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "30x",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Anton',
                                color: MyColors.blackColor,
                                fontSize: 64.0),
                          ),
                          Text(
                            "Nombre de Ejercicio",
                            textAlign: TextAlign.center,
                            style: MyTextStyle.heading3.copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Carga sugerida",
                                        textAlign: TextAlign.center,
                                        style: MyTextStyle.heading3
                                            .copyWith(fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "20 lb",
                                        textAlign: TextAlign.center,
                                        style: MyTextStyle.heading3.copyWith(
                                            fontSize: 22,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          showCadenceDialogue(context: context);
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Cadencia",
                                                textAlign: TextAlign.center,
                                                style: MyTextStyle.heading3
                                                    .copyWith(fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal:8.0),
                                              child: Icon(Icons.help_outline_rounded,size: 20,),
                                            )
                                          ],
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          return Text(
                                            "2-2",
                                            textAlign: TextAlign.center,
                                            style: MyTextStyle.heading3.copyWith(
                                                fontSize: 22,),
                                          );
                                        }
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Builder(
                                builder: (context) {
                                  var sets =  context.watch<GymExerciseProvider>().currentSet;
                                  return PrimaryButton(
                                    backgroundColor: MyColors.redColor,
                                    textColor: MyColors.whiteColor,
                                    borderColor: MyColors.redColor,
                                    title: "Completado ($sets/${provider.totalSets})",
                                    // title: (sets!=provider.totalSets)?"Completado ($sets/${provider.totalSets})":Constants.burpeesPauseButton,
                                    leadingChild: const Icon(
                                      Icons.done,
                                      // (sets!=provider.totalSets)?Icons.done:Icons.pause,
                                      size: 20,
                                      color: MyColors.whiteColor,
                                    ),
                                    onPressed: () {
                                      if (sets == provider.totalSets) {
                                        Navigator.pushNamed(context, RestScreen.tag);
                                      } else {
                                        context.read<GymExerciseProvider>().setCurrentSet(val: 2);
                                        Navigator.pushNamed(context,BreakBetweenSeriesScreen.tag);
                                      }
                                    },
                                  );
                                }
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
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, GymExerciseScreen.tag);
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
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, RestScreen.tag);
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(child: Container(
                            height: 20.0,
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(border: Border.all(color: MyColors.blackColor)),
                        child: Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: MyColors.whiteColor,
                                borderColor: Colors.transparent,
                                textColor: MyColors.greyColor,
                                title: Constants.burpeesReplaceExcButton,
                                onPressed: () {
                                  Navigator.pushNamed(context, ReplaceExerciseScreen.tag);
                                },
                              ),
                            ),
                            Container(
                              width: 1,
                              decoration: BoxDecoration(border: Border.all(color: MyColors.blackColor)),
                            ),
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: MyColors.whiteColor,
                                borderColor: Colors.transparent,
                                textColor: MyColors.greyColor,
                                title: Constants.burpeesAddNoteButton,
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
  showCadenceDialogue({required BuildContext context}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints:
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const DialogueCadence(),
          );
        });
  }
  showDialoguePause({required BuildContext context}) {
    showModalBottomSheet<void>(
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
                Navigator.pop(context);
              },
            ),
          );
        }).then((value) {

    });
  }

  @override
  void dispose() {
    context.read<GymExerciseProvider>().setCurrentSet(val: null);
    super.dispose();
  }

}
