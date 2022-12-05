import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/register_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

import 'update_password_status_screen.dart';

class UpdatePasswordScreen extends StatelessWidget {
  static const String tag = "update_password_screen";

  UpdatePasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  const Expanded(
                    child: Text(
                      Constants.updatePasswordScreenTitle,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading3,
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        Constants.updatePasswordScreenInfo,
                        style: MyTextStyle.paragraph1,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFieldPrimary(
                          isLabelRequired: true,
                          title: Constants.updatePasswordScreenPasswordLabel,
                          isObscure: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFieldPrimary(
                          isLabelRequired: true,
                          title: Constants.updatePasswordScreenConfirmPasswordLabel,
                          isObscure: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 6) {
                              return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                            }
                            else if (passwordController.text != confirmPasswordController.text) {
                              return "Las contraseñas no coinciden.";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                          title: Constants.verifyIdentityScreenContinue,
                          textColor: MyColors.whiteColor,
                          backgroundColor: MyColors.blackColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, UpdatePasswordStatusScreen.tag);
                            }
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
            ),
          ],
        ),
      ),
    );
  }
}
