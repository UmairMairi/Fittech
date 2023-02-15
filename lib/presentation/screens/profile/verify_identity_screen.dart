import 'package:fit_tech/logic/profile/verify_Identity_provider.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_circular_progress_indicator.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyIdentityScreen extends StatelessWidget {
  static const String tag = "verify_identity_screen";

  VerifyIdentityScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  bool isEnabled = false;

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
                      Constants.verifyIdentityScreenTitle,
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
                        Constants.verifyIdentityScreenInfo,
                        style: MyTextStyle.paragraph1,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFieldPrimary(
                          isLabelRequired: true,
                          title: Constants.verifyIdentityScreenPasswordLabel,
                          isObscure: true,
                          controller: passwordController,
                          onChanged: (val) {
                            context
                                .read<VerifyIdentityProvider>()
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
                          var bloc = context.watch<VerifyIdentityProvider>();

                          if (bloc.verifyIdentityInMap?["success"] == true) {
                            Future.delayed(Duration.zero, () {
                              Navigator.pushNamed(
                                  context, UpdatePasswordScreen.tag);
                            });
                          } else if (bloc.isLoading == true) {
                            return const MyCircularProgressIndicator();
                          } else if ((bloc.password.length >= 6) ||
                              Singleton.isDev) {
                            isEnabled = true;
                          }
                          return PrimaryButton(
                            title: Constants.verifyIdentityScreenContinue,
                            textColor: MyColors.whiteColor,
                            backgroundColor: MyColors.blackColor,
                            enabled: isEnabled,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await bloc.setVerifyIdentityInMap(
                                    context: context,
                                    password: passwordController.text);
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
