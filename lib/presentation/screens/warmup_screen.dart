import 'package:fit_tech/data/models/subscription_plans_tile_model.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class HeatingScreen extends StatelessWidget {
  const HeatingScreen({super.key});

  static const String tag = "warmup_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height *0.6,
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
                      valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: size.height *0.6,
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
                      const Text(
                        Constants.titleHeatingScreen,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Anton',
                            color: MyColors.blackColor,
                            fontSize: 42.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        Constants.heatingScreenSubHeading,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                          child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: MyColors.redColor, width: 5.0)),
                          padding: const EdgeInsets.all(20.0),
                          child: const Text(
                            "24",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Anton',
                                color: MyColors.blackColor,
                                fontSize: 42.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}