import 'package:fit_tech/presentation/screens/about/privacy_policy_screen.dart';
import 'package:fit_tech/presentation/screens/about/terms_conditions_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String tag = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Images.welcomeBackground,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Images.appLogo,
                      height: 30,
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, CreateAccountScreen.tag);
                          },
                          title: Constants.createAccount),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.tag);
                        },
                        title: Constants.login,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "${Constants.agreeTermsConditionsInfo}\n",
                          style: const TextStyle(fontSize: 15.0),
                          children: <TextSpan>[
                            TextSpan(
                                text: Constants.termsConditions,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, TermsConditionsScreen.tag);
                                  },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.whiteColor)),
                            const TextSpan(
                                text: " y ",
                                style: TextStyle(color: MyColors.whiteColor)),
                            TextSpan(
                                text: "${Constants.privacyPolicy}.",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, PrivacyPolicyScreen.tag);
                                  },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.whiteColor)),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
