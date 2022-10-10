import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String tag = "create_account_screen";

  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Constants.titleCreateAccount,
                      style: TextStyle(
                          fontFamily: 'Anton',
                          color: MyColors.blackColor,
                          fontSize: 42.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      Constants.createAccountInfo,
                      style: TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: SecondaryButton(
                        title: Constants.registerWithEmail,
                        image: 'assets/images/icon_mail.png',
                        textColor: MyColors.blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: SecondaryButton(
                        title: Constants.registerWithGoogle,
                        image: 'assets/images/icon_google.png',
                        textColor: MyColors.blackColor,
                      ),
                    ),
                    Expanded(child: Container()),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        Constants.alreadyHaveAccount,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontSize: 18.0),
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
