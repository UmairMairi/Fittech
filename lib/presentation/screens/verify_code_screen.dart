import 'package:fit_tech/presentation/screens/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/login_welcome_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  static const String tag = "verify_code_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                    Constants.titleVerifyCodeScreen,
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    Constants.verifyCodeScreenInfo,
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
                      title: Constants.verifyCodeScreenCodeLabel,
                      isObscure: false,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.verifyCodeScreenContinueLabel,
                      textColor: MyColors.whiteColor,
                      backgroundColor: MyColors.blackColor,
                      onPressed: (){
                        Navigator.pushNamed(context, LoginWelcomeScreen.tag);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.verifyCodeScreenResendCodeLabel,
                      textColor: MyColors.blackColor,
                      backgroundColor: MyColors.whiteColor,
                      onPressed: () {
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),

                  const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:20.0),
                      child: Text(
                        Constants.verifyCodeScreenResendTimerInfo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
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
