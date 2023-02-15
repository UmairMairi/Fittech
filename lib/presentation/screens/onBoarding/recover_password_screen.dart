import 'package:fit_tech/logic/recover_password_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/verify_code_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_circular_progress_indicator.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RecoverPasswordScreen extends StatelessWidget {
  RecoverPasswordScreen({super.key});

  static const String tag = "recover_password_screen";

  final TextEditingController emailController =
      TextEditingController(text: Singleton.isDev ? "test@mail.com" : "");
  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        Constants.titleRecoverPasswordScreen,
                        style: MyTextStyle.heading1,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        Constants.recoverPasswordScreenInfo,
                        style: MyTextStyle.paragraph1,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFieldPrimary(
                          isLabelRequired: true,
                          title: Constants.recoverPasswordScreenMailLabel,
                          isObscure: false,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            context
                                .read<RecoverPasswordProvider>()
                                .setEmail(val: val);
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
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Builder(builder: (context) {
                          var bloc = context.watch<RecoverPasswordProvider>();
                          if (bloc.recoverPasswordInMap?["message"] ==
                              "email sent successfully") {
                            Future.delayed(Duration.zero, () {
                              Navigator.pushNamed(
                                  context, VerifyCodeScreen.tag);
                            });
                          } else if (bloc.isLoading == true) {
                            return const MyCircularProgressIndicator();
                          } else if ((isEmail(bloc.email)) || Singleton.isDev) {
                            isEnabled = true;
                          }

                          return PrimaryButton(
                            title: Constants.recoverPasswordScreenContinueLabel,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.blackColor,
                            enabled: isEnabled,
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  isEnabled) {
                                GlobalState.email = emailController.text;
                                await bloc.setRecoverPasswordInMap(
                                    context: context,
                                    email: emailController.text);
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
