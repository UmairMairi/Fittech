import 'dart:async';

import 'package:fit_tech/logic/verify_code_provider.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
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

import '../../../logic/oboarding/create_account_provider.dart';
import '../../../utils/ScreenArguments.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String? email;
   const VerifyCodeScreen({super.key,this.email});

  static const String tag = "verify_code_screen";

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  CreateAccountProvider createAccountProvider=CreateAccountProvider();

  final TextEditingController otpController =
      TextEditingController(text: Singleton.isDev ? "123456" : "");
  bool isEnabled = false;
  String email="";

  final _formKey = GlobalKey<FormState>();

  var hideResend = true;

  Timer? countdownTimer;

  Duration myDuration = const Duration(seconds: 30);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(seconds: 30));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        setState(() {
          hideResend = false;
        });
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }



  @override
  void initState() {
    super.initState();
   email=widget.email ?? "";
    startTimer();
  }

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
                      Constants.titleVerifyCodeScreen,
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
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    Constants.verifyCodeScreenInfo,
                    style: MyTextStyle.paragraph1,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFieldPrimary(
                      controller: otpController,
                      isLabelRequired: true,
                      title: Constants.verifyCodeScreenCodeLabel,
                      isObscure: false,
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        context.read<VerifyCodeProvider>().setCode(val: val);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 4) {
                          return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Builder(builder: (context) {
                      var bloc = context.watch<VerifyCodeProvider>();
                      if (bloc.forgotPasswordVerifiedCodeResponseInMap?[
                              "message"] ==
                          "email verified successfully") {
                        Future.delayed(Duration.zero, () {
                          Navigator.pushNamed(context, UpdatePasswordScreen.tag);
                        });
                      } else if (bloc.isLoading == true) {
                        return const MyCircularProgressIndicator();
                      } else if ((bloc.code.length < 4) || Singleton.isDev) {
                        isEnabled = true;
                      }

                      return PrimaryButton(
                        title: Constants.verifyCodeScreenContinueLabel,
                        textColor: MyColors.whiteColor,
                        backgroundColor: MyColors.blackColor,
                        enabled: isEnabled,
                        onPressed: () async {
                          if (_formKey.currentState!.validate() && isEnabled) {
                            (GlobalState.email != null)
                                ? await bloc
                                    .setForgotPasswordVerifiedCodeResponseInMap(
                                        context: context,
                                        email: GlobalState.email!,
                                        code: otpController.text)
                                : showMessage(
                                    msg: "your email null", context: context);

                          }
                        },
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  StatefulBuilder(builder: (context, myState) {
                    return Column(
                      children: [
                        if (!hideResend)
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              title: Constants.resendLabel,
                              titleStyle: MyTextStyle.buttonTitle
                                  .copyWith(fontWeight: FontWeight.w600),
                              textColor: MyColors.blackColor,
                              backgroundColor: MyColors.whiteColor,
                              onPressed: () {
                                getData(context);
                                resetTimer();
                                startTimer();
                                myState(() {
                                  hideResend = true;
                                });
                              },
                            ),
                          ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        if (hideResend)
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "${Constants.verifyCodeScreenResendTimerInfo}${myDuration.inSeconds}s",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'Open Sance',
                                    color: MyColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    );
                  })

                  /*SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.verifyCodeScreenResendCodeLabel,
                      textColor: MyColors.blackColor,
                      backgroundColor: MyColors.whiteColor,
                      onPressed: () {

                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),

                  const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:20.0),
                      child: Text(
                        Constants.verifyCodeScreenResendTimerInfo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Open Sance',
                            color: MyColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  getData(BuildContext context) async {
    var model = await createAccountProvider.sendCode(context: context,email: email);
    if (model != null) {

    }
  }
}
