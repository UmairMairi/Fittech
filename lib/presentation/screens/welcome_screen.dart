import 'package:fit_tech/presentation/screens/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/login_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String tag = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CreateAccountScreen.tag);
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
                text: const TextSpan(
                    text: "${Constants.agreeTermsConditionsInfo}\n",
                    style: TextStyle(fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: Constants.termsConditions,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.whiteColor)),
                      TextSpan(
                          text: " y ",
                          style: TextStyle(color: MyColors.whiteColor)),
                      TextSpan(
                          text: "${Constants.privacyPolicy}.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.whiteColor)),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
