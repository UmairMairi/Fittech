import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String tag = "privacy_policy_screen";

  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyAppBar(title: Constants.privacyPolicyScreenTitle,),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                          text: "",
                          style: MyTextStyle.paragraph1,
                          children: <TextSpan>[
                            TextSpan(
                                text: "${Constants.privacyPolicyScreenInfoTitle1}\n\n",
                                style: MyTextStyle.heading3),
                            TextSpan(
                                text: Constants.privacyPolicyScreenInfo1,
                            ),
                            TextSpan(
                                text: "\n\n${Constants.privacyPolicyScreenInfoTitle2}\n\n",
                                style: MyTextStyle.heading3),
                            TextSpan(
                                text: "${Constants.privacyPolicyScreenInfo2}\n",
                            ),
                            TextSpan(
                                text: "\n\n${Constants.privacyPolicyScreenInfoTitle3}\n\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: MyColors.blackColor)),
                            TextSpan(
                                text: "${Constants.privacyPolicyScreenInfo3}\n",
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
