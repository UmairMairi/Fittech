import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class BodyMassScreen extends StatelessWidget {
  static const String tag = "body_mass_screen";

  const BodyMassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          children: [
            const MyAppBar(
              title: Constants.titleBodyMassScreen,
            ),
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    Constants.infoBodyMassScreen,
                    style: MyTextStyle.paragraph1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  Images.detailsBodyMassScreen,
                  width: double.infinity,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
