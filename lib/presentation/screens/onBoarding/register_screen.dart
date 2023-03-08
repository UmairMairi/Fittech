import 'package:fit_tech/logic/create_account_provider.dart';
import 'package:fit_tech/logic/oboarding/create_account_provider.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_loading.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/check_box.dart';
import 'package:fit_tech/presentation/widgets/my_circular_progress_indicator.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/string_extensions.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/shared_prefences_work.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String tag = "register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  final _confirmFieldKey = GlobalKey<FormState>();

  bool cbState1 = false;

  bool cbState2 = false;

  bool cbState3 = false;

  bool isEnabled = false;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
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
                              context.read<RegisterProvider>().setFirstName(val = val);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Entre com um nombre válido";
                              }
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
                              if (value == null || value.isEmpty) {
                                return "Entre com um appellido válido";
                              }
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
                                  if (value == null || value.isEmpty/* || value.length < 6*/) {
                                    return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                                  } else if (!value.containsLetters) {
                                    return "La contraseña debe tener al menos un carácter";
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
                      ],
                    ),
                  ),

                  Form(
                    key: _confirmFieldKey,
                    child: TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.confirmPasswordLabel,
                        isObscure: true,
                        controller: confirmPasswordController,
                        onChanged: (val) {
                          context.read<RegisterProvider>().setConfirmPassword(val = val);
                          if (val.length >= passwordController.text.length) {
                            _confirmFieldKey.currentState!.validate();
                            print("validate == true");
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 6) {
                            return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                          } else if (value != passwordController.text) {
                            return "Las contraseñas no coinciden.";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword),
                  ),
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
                      if ((bloc.firstName.isNotEmpty &&
                              bloc.lastName.isNotEmpty &&
                              isEmail(bloc.email) &&
                              (bloc.password.length >= 6) &&
                              (bloc.confirmPassword.length >= 6) &&
                              (bloc.password == bloc.confirmPassword) &&
                              bloc.info1Checked &&
                              bloc.info2Checked &&
                              bloc.info3Checked) ||
                          Singleton.isDev) {
                        isEnabled = true;
                      } else {
                        isEnabled = false;
                      }
                      if (bloc.isLoading == true) {
                        return const LoadingButton();
                      }
                      return PrimaryButton(
                        title: Constants.continueLabel,
                        textColor: MyColors.whiteColor,
                        backgroundColor: MyColors.blackColor,
                        // enabled: isEnabled,
                        onPressed: () async {
                          var validate1 = _formKey.currentState!.validate();
                          var validate2 = _confirmFieldKey.currentState!.validate();
                          if (validate1 && validate2) {
                            if (cbState1 && cbState2 && cbState3) {
                              await bloc.createAccount(
                                context: context,
                              );
                            } else {
                              showMessage(
                                  context: context,
                                  msg: "Por favor seleccione las condiciones primero.");
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
          ],
        ),
      ),
    );
  }
}
