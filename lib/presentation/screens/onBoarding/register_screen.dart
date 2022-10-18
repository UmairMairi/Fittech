import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/check_box.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String tag = "register_screen";

  final TextEditingController fNameController = TextEditingController(text: "Angel");
  final TextEditingController lNameController =
      TextEditingController(text: "Valverde");
  final TextEditingController emailController =
      TextEditingController(text: "angelvalverde@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "123456");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "123456");

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
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
                      Constants.titleRegisterScreen,
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
            Padding(
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
                      Constants.registerInfo,
                      style: MyTextStyle.paragraph1,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.nameLabel,
                        isObscure: false,
                        controller: fNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {}
                          return null;
                        },
                        keyboardType: TextInputType.name),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.surNameLabel,
                        isObscure: false,
                        controller: lNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {}
                          return null;
                        },
                        keyboardType: TextInputType.name),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.registerEmailLabel,
                        isObscure: false,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Entre com um email válido";
                          } else if (!isEmail(value)) {
                            return "Entre com um email válido";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.registerPasswordLabel,
                        isObscure: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "digite uma senha válida";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.confirmPasswordLabel,
                        isObscure: true,
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "digite uma senha válida";
                          } else if (value != passwordController.text) {
                            return "Las contraseñas no coinciden.";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 25.0,
                    ),
                    MyCheckBox(
                        title: Constants.cb1Label,
                        isChecked: false,
                        valueChanged: (state) {}),
                    const SizedBox(
                      height: 25.0,
                    ),
                    MyCheckBox(
                        isChecked: false,
                        valueChanged: (state) {},
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(text: Constants.cb2Label1,
                              style: MyTextStyle.paragraph1,
                              children: <TextSpan>[
                            TextSpan(
                              text: Constants.cb2Label2,
                              style: MyTextStyle.paragraph1.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ]),
                        )),
                    const SizedBox(
                      height: 25.0,
                    ),
                    MyCheckBox(
                        title: Constants.cb3Label,
                        isChecked: false,
                        valueChanged: (state) {}),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        title: Constants.continueLabel,
                        textColor: MyColors.whiteColor,
                        backgroundColor: MyColors.blackColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, OTPScreen.tag);
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
          ],
        ),
      ),
    );
  }
}
