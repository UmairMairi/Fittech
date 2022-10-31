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
        body: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: MyColors.blackColor,
                    size: 24.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Text(
                    Constants.termsConditionsScreenTitle,
                    textAlign: TextAlign.center,
                    style: MyTextStyle.heading3,
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: MyColors.blackColor,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                    style: MyTextStyle.paragraph1,
                    children: <TextSpan>[
                      TextSpan(
                          text: "\n\n${Constants.termsConditionsScreenInfoTitle1}\n\n",
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
    );
  }
}
