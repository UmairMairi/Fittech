import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/register_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String tag = "create_account_screen";

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 65.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Constants.titleCreateAccount,
                      style: MyTextStyle.heading1,),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      Constants.createAccountInfo,
                      style: MyTextStyle.paragraph1
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SecondaryButton(
                        title: Constants.registerWithEmail,
                        image: 'assets/images/icon_mail.png',
                        textColor: MyColors.blackColor,
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.tag);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SecondaryButton(
                        title: Constants.registerWithGoogle,
                        image: 'assets/images/icon_google.png',
                        textColor: MyColors.blackColor,
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.tag);
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(
                            context, LoginScreen.tag);
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          Constants.alreadyHaveAccount,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Open Sance',
                              color: MyColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
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
