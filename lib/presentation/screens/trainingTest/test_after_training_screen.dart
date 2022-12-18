import 'package:fit_tech/logic/profile/test_after_training_provider.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'show_level_screen.dart';

class TestAfterScreen extends StatefulWidget {
  const TestAfterScreen({super.key});

  static const String tag = "test_after_screen";

  @override
  State<TestAfterScreen> createState() => _TestAfterScreenState();
}

class _TestAfterScreenState extends State<TestAfterScreen> {

  @override
  void initState() {
    super.initState();
    context.read<TestAfterTrainingProvider>().startTimer();
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
                  Container(
                    height: size.height * 0.5,
                    width: size.width,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(20.0),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20,),
                          Text(
                            Constants.titleBurpeesScreen,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.heading2.copyWith(fontSize: 24),
                          ),
                          const Expanded(
                            child: SizedBox(
                              height: 20.0,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              var duration = context.watch<TestAfterTrainingProvider>().myDuration;
                              return Text(
                                MyUtils.printDuration(duration: duration),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'Anton',
                                    color: MyColors.blackColor,
                                    fontSize: 58.0),
                              );
                            }
                          ),
                          const Expanded(
                            child: SizedBox(
                              height: 20.0,
                            ),
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                backgroundColor: MyColors.redColor,
                                textColor: MyColors.whiteColor,
                                borderColor: MyColors.redColor,
                                title: Constants.testAfterScreenTitleButtonLabel,
                                onPressed: (){
                                  context.read<TestAfterTrainingProvider>().resetTimer();
                                  Navigator.pushNamed(context, ShowLevelScreen.tag);
                                },
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
