import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/recover_password_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String tag = "login_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.centerLeft,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Constants.titleLoginScreen,
                    style: TextStyle(
                        fontFamily: 'Anton',
                        color: MyColors.blackColor,
                        fontSize: 42.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    Constants.loginInfo,
                    style: TextStyle(
                        fontFamily: 'Open Sance',
                        color: MyColors.blackColor,
                        fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.emailLabel,
                      isObscure: false,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.passwordLabel,
                      isObscure: false,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.signIn,
                      textColor: MyColors.whiteColor,
                      backgroundColor: MyColors.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.createAccountTitle,
                      textColor: MyColors.blackColor,
                      backgroundColor: MyColors.whiteColor,
                      onPressed: (){
                        Navigator.pushNamed(context, CreateAccountScreen.tag);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black,
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          Constants.or,
                          style: TextStyle(
                              color: MyColors.blackColor, fontSize: 15.0),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: SecondaryButton(
                      title: Constants.loginWithGoogle,
                      image: 'assets/images/icon_google.png',
                      textColor: MyColors.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.popAndPushNamed(context, RecoverPasswordScreen.tag);
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        Constants.forgotPassword,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
