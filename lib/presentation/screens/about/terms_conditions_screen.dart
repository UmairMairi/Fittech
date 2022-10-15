import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
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
                          text: "\n\n${Constants.termsConditionsScreenInfoTitle1}\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: MyColors.blackColor)),
                      TextSpan(
                          text: Constants.termsConditionsScreenInfo1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: MyColors.blackColor),
                      ),
                      TextSpan(
                          text: "\n\n${Constants.termsConditionsScreenInfoTitle2}\n\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: MyColors.blackColor)),
                      TextSpan(
                          text: "${Constants.termsConditionsScreenInfo2}\n",
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
