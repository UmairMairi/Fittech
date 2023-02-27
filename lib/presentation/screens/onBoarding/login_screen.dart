import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/recover_password_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_loading.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String tag = "login_screen";
  final TextEditingController emailController =
      TextEditingController(text: Singleton.isDev ? "test@mail.com" : "");
  final TextEditingController passwordController =
      TextEditingController(text: Singleton.isDev ? "123456" : "");

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
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
                  ],
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
                      style: MyTextStyle.heading1,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      Constants.loginInfo,
                      style: MyTextStyle.paragraph1,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.emailLabel,
                      isObscure: false,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        context.read<LoginProvider>().setEmail(val = val);
                      },
                      validator: (val) {
                        if (val == null && val!.isEmpty) {
                          return "El correo ingresado no está registrado";
                        } else if (!isEmail(val)) {
                          return "El correo ingresado no está registrado";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                      isLabelRequired: true,
                      title: Constants.passwordLabel,
                      isObscure: true,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (val) {
                        context.read<LoginProvider>().setPassword(val = val);
                      },
                      validator: (val) {
                        if (val == null && val!.isEmpty) {
                          return "Por favor introduce una contraseña válida";
                        } else if (val.length < 6) {
                          return "La longitud de la contraseña no debe ser inferior a 6 dígitos";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Builder(builder: (context) {
                        var bloc = context.watch<LoginProvider>();
                        if (bloc.isLoading == true) {
                          return const LoadingButton();
                        }
                        if ((isEmail(bloc.email) && bloc.password.length >= 6) || Singleton.isDev) {
                          isEnabled = true;
                        }
                        return PrimaryButton(
                          title: Constants.signIn,
                          textColor: MyColors.whiteColor,
                          backgroundColor: MyColors.blackColor,
                          enabled: isEnabled,
                          onPressed: () async {
                            if (_formKey.currentState!.validate() && isEnabled) {
                              await bloc.login(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        title: Constants.createAccountTitle,
                        textColor: MyColors.blackColor,
                        backgroundColor: MyColors.whiteColor,
                        onPressed: () {
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
                      height: 30.0,
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
                      onTap: () {
                        Navigator.pushNamed(context, RecoverPasswordScreen.tag);
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          Constants.forgotPassword,
                          textAlign: TextAlign.center,
                          style: MyTextStyle.heading3,
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
      ),
    );
  }
}
