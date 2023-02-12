import 'package:fit_tech/logic/profile/verify_Identity_provider.dart';
import 'package:fit_tech/logic/update_password_provider.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/shared_prefences_work.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/my_circular_progress_indicator.dart';
import 'update_password_status_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  static const String tag = "update_password_screen";

  UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<VerifyIdentityProvider>(context, listen: false);

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
                          onChanged: (val) {
                            context
                                .read<UpdatePasswordProvider>()
                                .setPassword(val: val);
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name),
                      Text(
                        "Debe contener mínimo 6 caracteres y un número.",
                        style: MyTextStyle.normal
                            .copyWith(fontSize: 15, color: null),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFieldPrimary(
                          isLabelRequired: true,
                          title: Constants
                              .updatePasswordScreenConfirmPasswordLabel,
                          isObscure: true,
                          controller: confirmPasswordController,
                          onChanged: (val) {
                            context
                                .read<UpdatePasswordProvider>()
                                .setConfirmPassword(val: val);
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                            } else if (passwordController.text !=
                                confirmPasswordController.text) {
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
                        child: Builder(builder: (context) {
                          var bloc = context.watch<UpdatePasswordProvider>();
                          bool isEnabled = false;
                          if (bloc.updatePasswordAfterLoginResponseInMap![
                                      "message"] ==
                                  "password changed Successfully" ||
                              bloc.newPasswordResponseInMap!["message"] ==
                                  "Password Reset Successfully!") {
                            SharedPreferencesWork
                                .clearSharePreferenceForRecoverPassword();
                            Navigator.pushNamed(
                                context, UpdatePasswordStatusScreen.tag);
                          } else if (bloc.isLoading == true) {
                            const MyCircularProgressIndicator();
                          } else if ((bloc.password.length >= 6 &&
                                  bloc.confirmPassword.length >= 6) ||
                              Singleton.isDev) {
                            isEnabled = true;
                          }
                          return PrimaryButton(
                            title: Constants.verifyIdentityScreenContinue,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.blackColor,
                            enabled: isEnabled,
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  isEnabled) {
                                (provider.verifyIdentityInMap?['message'] ==
                                        "Identity Verified Successfully")
                                    ? await bloc
                                        .setUpdatePasswordAfterLoginResponseInMap(
                                            context: context,
                                            currentPassword:
                                                passwordController.text,
                                            confirmPassword:
                                                confirmPasswordController.text)
                                    : await bloc.setNewPasswordResponseInMap(
                                        context: context,
                                        email: GlobalState.email!,
                                        newPassword: passwordController.text);
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
            ),
          ],
        ),
      ),
    );
  }
}
