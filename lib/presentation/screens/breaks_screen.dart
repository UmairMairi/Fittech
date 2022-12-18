import 'package:fit_tech/data/models/subscription_plans_tile_model.dart';
import 'package:fit_tech/logic/excercise/rest_between_sequence_provider.dart';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({super.key});

  static const String tag = "break_screen";

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BreakBetweenSequenceProvider>().startTimer(context:context);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration:
                            const BoxDecoration(color: MyColors.blackColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(Constants.titleRestScreen,
                                textAlign: TextAlign.center,
                                style: MyTextStyle.heading1
                                    .copyWith(color: MyColors.whiteColor)),
                            const SizedBox(
                              height: 20,
                            ),
                            Builder(
                              builder: (context) {
                                var duration = context.watch<BreakBetweenSequenceProvider>().myDuration;
                                return Text(MyUtils.printDuration(duration: duration),
                                    textAlign: TextAlign.center,
                                    style: MyTextStyle.heading1.copyWith(
                                        color: MyColors.whiteColor, fontSize: 52));
                              }
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                      title: Constants.restScreenAddButton,
                                      backgroundColor: MyColors.blackColor,
                                      textColor: MyColors.whiteColor,
                                      borderColor: MyColors.whiteColor,
                                      onPressed: () {
                                        context.read<BreakBetweenSequenceProvider>().addDuration();
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: PrimaryButton(
                                      title: Constants.restScreenOmitButton,
                                      backgroundColor: MyColors.whiteColor,
                                      textColor: MyColors.blackColor,
                                      onPressed: () {
                                        context.read<BreakBetweenSequenceProvider>().resetTimer();
                                        Navigator.pushNamed(context,ExerciseScreen.tag);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            "Próximo 2/12",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.greyColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Escalada de Montaña",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Open Sance',
                                  color: MyColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0),
                            ),
                          ),
                          Text(
                            "X12",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.redColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    )),
                    Container(
                      height: 100,
                      width: 100,
                      color: MyColors.greyColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
