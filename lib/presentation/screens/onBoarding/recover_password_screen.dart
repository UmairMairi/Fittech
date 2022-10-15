import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/verify_code_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class RecoverPasswordScreen extends StatelessWidget {
  const RecoverPasswordScreen({super.key});

  static const String tag = "recover_password_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        Constants.titleRecoverPasswordScreen,
                        style: TextStyle(
                            fontFamily: 'Anton',
                            color: MyColors.blackColor,
                            fontSize: 42.0),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        Constants.recoverPasswordScreenInfo,
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
                          title: Constants.recoverPasswordScreenMailLabel,
                          isObscure: false,
                          keyboardType: TextInputType.text),
                      Expanded(child: Container()),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                          title: Constants.recoverPasswordScreenContinueLabel,
                          textColor: MyColors.whiteColor,
                          backgroundColor: MyColors.blackColor,
                          onPressed: (){
                            Navigator.pushNamed(context, VerifyCodeScreen.tag);
                          },
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
      ),
    );
  }
}
