import 'dart:async';

import 'package:fit_tech/logic/verify_code_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  static const String tag = "verify_code_screen";

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController otpController =
      TextEditingController(text: Singleton.isDev?"123456":"");

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
                      isLabelRequired: true,
                      title: Constants.verifyCodeScreenCodeLabel,
                      isObscure: false,
                      keyboardType: TextInputType.text,
                      onChanged: (val){
                        context.read<VerifyCodeProvider>().setCode(val: val);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return "la longitud de la contrase??a no debe ser inferior a 6 caracteres";
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
                    child: Builder(
                      builder: (context) {
                        var bloc = context.watch<VerifyCodeProvider>();
                        bool isEnabled = false;
                        if((bloc.code.length>=6)||Singleton.isDev){
                          isEnabled = true;
                        }
                        return PrimaryButton(
                          title: Constants.verifyCodeScreenContinueLabel,
                          textColor: MyColors.whiteColor,
                          backgroundColor: MyColors.blackColor,
                          enabled: isEnabled,
                          onPressed: () {
                            if (_formKey.currentState!.validate() && isEnabled) {
                              Navigator.pushNamed(
                                  context, UpdatePasswordScreen.tag);
                            }
                          },
                        );
                      }
                    ),
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
}
