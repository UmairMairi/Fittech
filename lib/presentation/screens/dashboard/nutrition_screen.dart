import 'package:fit_tech/data/models/intro_model.dart';
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

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  static const String tag = "nutrition_screen";

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
        child: Stack(
      alignment: Alignment.topCenter,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            Images.nutritionScreenBanner,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.width,
                    width: size.width,
                  ),
                  Text(
                    Constants.nutritionScreenTitle,
                    textAlign: TextAlign.center,
                    style: MyTextStyle.heading1
                        .copyWith(color: MyColors.whiteColor),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    Constants.nutritionScreenInfo,
                    textAlign: TextAlign.center,
                    style: MyTextStyle.paragraph1
                        .copyWith(color: MyColors.whiteColor),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.nutritionScreenButtonTitle,
                      textColor: MyColors.whiteColor,
                      backgroundColor: MyColors.redColor,
                      borderColor: MyColors.redColor,
                      onPressed: () {
                        Navigator.pushNamed(context, TestimonialScreen.tag);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
