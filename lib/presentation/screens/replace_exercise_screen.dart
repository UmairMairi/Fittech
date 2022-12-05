import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/presentation/widgets/today_workout_home.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class ReplaceExerciseScreen extends StatefulWidget {
  const ReplaceExerciseScreen({super.key});

  static const String tag = "replace_exercise_screen";

  @override
  State<ReplaceExerciseScreen> createState() => _ReplaceExerciseScreenState();
}

class _ReplaceExerciseScreenState extends State<ReplaceExerciseScreen>
    with TickerProviderStateMixin {
  var selectedIndex = -1;

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
            const MyAppBar(title: Constants.titleReplaceExercise),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      Constants.replaceExerciseInfo,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontSize: 18.0,
                          height: 1.5),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      Constants.replaceExerciseSubHeading,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    color: MyColors.greyColor,
                                  ),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Escalada de Montaña",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: 'Open Sance',
                                                  color: MyColors.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Ver ejercicio",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: 'Open Sance',
                                                  color: MyColors.redColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      )),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: (index == selectedIndex)
                                                    ? MyColors.redColor
                                                    : MyColors.blackColor,
                                                width: 2)),
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PrimaryButton(
                title: Constants.replaceExerciseReplaceButton,
                backgroundColor: MyColors.blackColor,
                textColor: MyColors.whiteColor,
                onPressed: () {
                  if(selectedIndex!=-1){
                    Navigator.pushNamed(context, ExerciseScreen.tag);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
