import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class NutritionStrategyScreen extends StatelessWidget {
  static const String tag = "nutrition_strategy_screen";

  const NutritionStrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          children: [
            const MyAppBar(title: Constants.titleNutritionStrategyScreen,),
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:20.0),
                      child: Text(Constants.infoNutritionStrategyScreen,
                        style: MyTextStyle.paragraph1,),
                    ),
                    SizedBox(height: 20,),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
