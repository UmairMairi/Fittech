import 'dart:async';

import 'package:fit_tech/logic/otp_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_circular_progress_indicator.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/shared_prefences_work.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  static const String tag = "otp_screen";

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController =
      TextEditingController(text: Singleton.isDev ? "123456" : "");
  bool isEnabled = false;

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
    // startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 65,
              child: Align(
                alignment: Alignment.centerLeft,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Constants.titleOtpScreen,
                      style: MyTextStyle.heading1,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      Constants.otpInfo,
                      style: MyTextStyle.paragraph1,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFieldPrimary(
                        isLabelRequired: true,
                        title: Constants.codeLabel,
                        isObscure: false,
                        controller: otpController,
                        onChanged: (val) {
                          context.read<OTPProvider>().setPassword(val: val);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 4) {
                            return "la longitud de la contraseña no debe ser inferior a 6 caracteres";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Builder(builder: (context) {
                        var bloc = context.watch<OTPProvider>();
                       if (bloc.isLoading == true) {
                          return const MyCircularProgressIndicator();
                        }
                        return PrimaryButton(
                          title: Constants.verifyLabel,
                          textColor: MyColors.whiteColor,
                          backgroundColor: MyColors.blackColor,
                          enabled: (bloc.otp.length >= 4) || Singleton.isDev,
                          onPressed: () async {
                            if (_formKey.currentState!.validate() && ((bloc.otp.length >= 4) || Singleton.isDev)) {
                              await bloc.setEmailVerifyAfterCreateAccountModel(
                                  context: context,
                                  code: otpController.text,
                                  email: GlobalState.email!);
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
                          // if (!hideResend)
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              title: Constants.resendLabel,
                              titleStyle: MyTextStyle.buttonTitle
                                  .copyWith(fontWeight: FontWeight.w600),
                              textColor: MyColors.blackColor,
                              backgroundColor: MyColors.whiteColor,
                              enabled: !hideResend,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "${Constants.resendTimerInfo}${myDuration.inSeconds}s",
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
