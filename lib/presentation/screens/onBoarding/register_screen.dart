import 'package:fit_tech/logic/create_account_provider.dart';
import 'package:fit_tech/logic/oboarding/create_account_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/check_box.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_prefences_work.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String tag = "register_screen";

  final TextEditingController fNameController =
      TextEditingController(text: Singleton.isDev ? "Angel" : "");
  final TextEditingController lNameController =
      TextEditingController(text: Singleton.isDev ? "Valverde" : "");
  final TextEditingController emailController = TextEditingController(
      text: Singleton.isDev ? "angelvalverde@gmail.com" : "");
  final TextEditingController passwordController =
      TextEditingController(text: Singleton.isDev ? "123456" : "");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: Singleton.isDev ? "123456" : "");

  final _formKey = GlobalKey<FormState>();
  bool cbState1 = false;
  bool cbState2 = false;
  bool cbState3 = false;

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
                        onChanged: (val) {
                          context
                              .read<RegisterProvider>()
                              .setFirstName(val = val);
                        },
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
                        onChanged: (val) {
                          context
                              .read<RegisterProvider>()
                              .setLastName(val = val);
                        },
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
                        onChanged: (val) {
                          context.read<RegisterProvider>().setEmail(val = val);
                        },
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldPrimary(
                            isLabelRequired: true,
                            title: Constants.registerPasswordLabel,
                            isObscure: true,
                            controller: passwordController,
                            onChanged: (val) {
                              context
                                  .read<RegisterProvider>()
                                  .setPassword(val = val);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "digite uma senha válida";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword),
                        Text(
                          "Debe contener mínimo 6 caracteres y un número.",
                          style: MyTextStyle.paragraph2
                              .copyWith(color: MyColors.greyColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.confirmPasswordLabel,
                        isObscure: true,
                        controller: confirmPasswordController,
                        onChanged: (val) {
                          context
                              .read<RegisterProvider>()
                              .setConfirmPassword(val = val);
                        },
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
                        valueChanged: (state) {
                          cbState1 = state;
                          context.read<RegisterProvider>().setInfo1(val: state);
                        }),
                    const SizedBox(
                      height: 25.0,
                    ),
                    MyCheckBox(
                        isChecked: false,
                        valueChanged: (state) {
                          cbState2 = state;
                          context.read<RegisterProvider>().setInfo2(val: state);
                        },
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: Constants.cb2Label1,
                              style: MyTextStyle.paragraph1,
                              children: <TextSpan>[
                                TextSpan(
                                  text: Constants.cb2Label2,
                                  style: MyTextStyle.paragraph1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ]),
                        )),
                    const SizedBox(
                      height: 25.0,
                    ),
                    MyCheckBox(
                        title: Constants.cb3Label,
                        isChecked: false,
                        valueChanged: (state) {
                          cbState3 = state;
                          context.read<RegisterProvider>().setInfo3(val: state);
                        }),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Builder(builder: (context) {
                        var bloc = context.watch<RegisterProvider>();
                        var registerProvider =
                            context.watch<CreateAccountProvider>();
                        bool isEnabled = false;

                        if (registerProvider.message?["message"] == "User Registered Successfully") {
                          Future.delayed(Duration.zero, () {
                            Navigator.pushNamed(context, OTPScreen.tag);
                          });
                        } else if (registerProvider.isLoading == true) {
                          return Center(
                            child: RawMaterialButton(
                              onPressed: () {},
                              fillColor: MyColors.blackColor,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              constraints: const BoxConstraints(),
                              child: const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: MyColors.whiteColor)),
                            ),
                          );
                        } else if ((bloc.firstName.isNotEmpty &&
                                bloc.lastName.isNotEmpty &&
                                isEmail(bloc.email) &&
                                (bloc.password.length >= 6) &&
                                (bloc.confirmPassword.length >=
                                    6) /* && (bloc.password==bloc.confirmPassword)*/ &&
                                bloc.info1Checked &&
                                bloc.info2Checked &&
                                bloc.info3Checked) ||
                            Singleton.isDev) {
                          isEnabled = true;
                        }
                        return PrimaryButton(
                          title: Constants.continueLabel,
                          textColor: MyColors.whiteColor,
                          backgroundColor: MyColors.blackColor,
                          enabled: isEnabled,
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                isEnabled) {
                              if (cbState1 && cbState2 && cbState3) {
                                GlobalState.email= emailController.text;
                                await registerProvider.setMessage(
                                    context: context,
                                    firstName: fNameController.text,
                                    lastName: lNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text);
                              } else {
                                showMessage(
                                    context: context,
                                    msg: "Please select the conditions first");
                              }
                            }
                          },
                        );
                      }),
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
