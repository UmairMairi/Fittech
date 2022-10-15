import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String tag = "privacy_policy_screen";

  const PrivacyPolicyScreen({super.key});

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
                    Constants.privacyPolicyScreenTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Open Sance',
                        color: MyColors.blackColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
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
                    text: "",
                    children: <TextSpan>[
                      TextSpan(
                          text: "\n\n${Constants.privacyPolicyScreenInfoTitle1}\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: MyColors.blackColor)),
                      TextSpan(
                          text: Constants.privacyPolicyScreenInfo1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: MyColors.blackColor),
                      ),
                      TextSpan(
                          text: "\n\n${Constants.privacyPolicyScreenInfoTitle2}\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: MyColors.blackColor)),
                      TextSpan(
                          text: "${Constants.privacyPolicyScreenInfo2}\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: MyColors.blackColor),
                      ),
                      TextSpan(
                          text: "\n\n${Constants.privacyPolicyScreenInfoTitle3}\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: MyColors.blackColor)),
                      TextSpan(
                          text: "${Constants.privacyPolicyScreenInfo3}\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: MyColors.blackColor),
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
