import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  static const String tag = "terms_conditions_screen";

  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyAppBar(title: Constants.termsConditionsScreenTitle,),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                          style: MyTextStyle.paragraph1,
                          children: <TextSpan>[
                            TextSpan(
                                text: "${Constants.termsConditionsScreenInfoTitle1}\n\n",
                                style: MyTextStyle.heading3),
                            TextSpan(
                                text: Constants.termsConditionsScreenInfo1,
                            ),
                            TextSpan(
                                text: "\n\n${Constants.termsConditionsScreenInfoTitle2}\n\n",
                                style: MyTextStyle.heading3),
                            TextSpan(
                                text: "${Constants.termsConditionsScreenInfo2}\n",
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
