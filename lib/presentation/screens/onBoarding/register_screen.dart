import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/presentation/widgets/check_box.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String tag = "register_screen";

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
                    Constants.titleRegisterScreen,
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
                    height: 10.0,
                  ),
                  const Text(
                    Constants.registerInfo,
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
                      title: Constants.nameLabel,
                      isObscure: false,
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.surNameLabel,
                      isObscure: false,
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.registerEmailLabel,
                      isObscure: false,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.registerPasswordLabel,
                      isObscure: true,
                      keyboardType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.confirmPasswordLabel,
                      isObscure: true,
                      keyboardType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyCheckBox(
                      title: Constants.cb1Label,
                      isChecked: false,
                      valueChanged: (state) {}),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyCheckBox(
                      title: Constants.cb2Label,
                      isChecked: false,
                      valueChanged: (state) {}),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyCheckBox(
                      title: Constants.cb3Label,
                      isChecked: false,
                      valueChanged: (state) {}),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.continueLabel,
                      textColor: MyColors.whiteColor,
                      backgroundColor: MyColors.blackColor,
                      onPressed: () {
                        Navigator.pushNamed(context, OTPScreen.tag);
                      },
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
