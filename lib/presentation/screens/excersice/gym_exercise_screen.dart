import 'package:fit_tech/logic/excercise/gym_excercise_provider.dart';
import 'package:fit_tech/presentation/screens/break_between_series_screen.dart';
import 'package:fit_tech/presentation/screens/breaks_screen.dart';
import 'package:fit_tech/presentation/screens/dialogue/add_note_dialogue.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/dialogue_pause.dart';
import 'package:fit_tech/presentation/screens/replace_exercise_screen.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_rate_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GymExerciseScreen extends StatefulWidget {
  final dynamic type;

  const GymExerciseScreen({super.key, this.type});

  static const String tag = "gym_exercise_screen";

  @override
  State<GymExerciseScreen> createState() => _GymExerciseScreenState();
}
class _GymExerciseScreenState extends State<GymExerciseScreen> {
  var isResumed = false;
  GymExerciseProvider? provider;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      provider = Provider.of<GymExerciseProvider>(context, listen: false);
      provider?.setCurrentSet(val: 1);
      provider?.startTimer();
      // context.read<GymExerciseProvider>().startTimer();
    });
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.4,
                            width: size.width,
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialoguePause(context: context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color:
                                          MyColors.whiteColor.withOpacity(0.8),
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
                          Expanded(
                              child: Container(
                            height: 20.0,
                          )),
                          if(widget.type == GymExerciseScreenTypes.outdoor)
                            Builder(
                              builder: (context) {
                                var bloc = context.watch<GymExerciseProvider>();
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: LinearProgressIndicator(
                                        minHeight: 8,
                                        backgroundColor: Colors.transparent,
                                        value: (1/30)*bloc.myDuration.inSeconds,
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(MyColors.redColor.withOpacity(0.2)),
                                      ),
                                    ),
                                    Text(
                                      MyUtils.printDuration(duration: bloc.myDuration),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontFamily: 'Anton',
                                          color: MyColors.blackColor,
                                          fontSize: 58.0),
                                    )
                                  ],
                                );
                              }
                            ),
                          if(widget.type == GymExerciseScreenTypes.gym)
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
                          Expanded(
                              child: Container(
                            height: 20.0,
                          )),
                          if(widget.type == GymExerciseScreenTypes.outdoor)
                            Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Tiempo de set",
                                          textAlign: TextAlign.center,
                                          style: MyTextStyle.heading3.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "0:30",
                                          textAlign: TextAlign.center,
                                          style: MyTextStyle.heading3.copyWith(
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Intensidad",
                                                textAlign: TextAlign.center,
                                                style: MyTextStyle.heading3
                                                    .copyWith(
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showCadenceDialogue(
                                                    context: context);
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Icon(
                                                  Icons.help_outline_rounded,
                                                  size: 20,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Builder(builder: (context) {
                                          return Text(
                                            "2-2",
                                            textAlign: TextAlign.center,
                                            style: MyTextStyle.heading3.copyWith(
                                              fontSize: 22,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if(widget.type == GymExerciseScreenTypes.gym)
                            Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Carga sugerida",
                                        textAlign: TextAlign.center,
                                        style: MyTextStyle.heading3.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "20 lb",
                                        textAlign: TextAlign.center,
                                        style: MyTextStyle.heading3.copyWith(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Cadencia",
                                              textAlign: TextAlign.center,
                                              style: MyTextStyle.heading3
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showCadenceDialogue(
                                                  context: context);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Icon(
                                                Icons.help_outline_rounded,
                                                size: 20,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Builder(builder: (context) {
                                        return Text(
                                          "2-2",
                                          textAlign: TextAlign.center,
                                          style: MyTextStyle.heading3.copyWith(
                                            fontSize: 22,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                              child: Container(
                            height: 20.0,
                          )),
                          SizedBox(
                              width: double.infinity,
                              child: Builder(builder: (context) {
                                var sets = context.watch<GymExerciseProvider>();
                                return PrimaryButton(
                                  backgroundColor: MyColors.redColor,
                                  textColor: MyColors.whiteColor,
                                  borderColor: MyColors.redColor,
                                  title:
                                      "Completado (${sets.currentSet}/${sets.totalSets})",
                                  // title: (sets!=provider.totalSets)?"Completado ($sets/${provider.totalSets})":Constants.burpeesPauseButton,
                                  leadingChild: const Icon(
                                    Icons.done,
                                    // (sets!=provider.totalSets)?Icons.done:Icons.pause,
                                    size: 20,
                                    color: MyColors.whiteColor,
                                  ),
                                  onPressed: () {
                                    if (sets.currentSet == sets.totalSets) {
                                      Navigator.pushNamed(
                                          context, RestScreen.tag);
                                    } else {
                                      context.read<GymExerciseProvider>().setCurrentSet(val: 2);
                                      Navigator.pushNamed(context, BreakBetweenSeriesScreen.tag).whenComplete((){
                                        if(widget.type == GymExerciseScreenTypes.outdoor){
                                          provider?.resetTimer();
                                          provider?.startTimer();
                                        }
                                      });
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
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
                  SizedBox(
                      width: double.infinity,
                      child: Container(
                        height: 62,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: MyColors.greyBorderColor)),
                        child: Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: MyColors.whiteColor,
                                borderColor: Colors.transparent,
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
                            Container(
                              width: 1,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.greyBorderColor)),
                            ),
                            Expanded(
                              child: PrimaryButton(
                                backgroundColor: MyColors.whiteColor,
                                borderColor: Colors.transparent,
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
            child: const SingleChildScrollView(child: DialogueCadence()),
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
                Navigator.pushNamed(context, TodayTrainingScreen.tag,arguments: (widget.type == GymExerciseScreenTypes.outdoor)?2:1);
              },
            ),
          );
        }).then((value) {});
  }

  @override
  void dispose() {
    provider?.disposeProvider();
    super.dispose();
  }
}

enum GymExerciseScreenTypes{gym,outdoor}
