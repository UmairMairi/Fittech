import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/btn_secondary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  static const String tag = "otp_screen";
  final TextEditingController otpController = TextEditingController(
      text: "Angel");
  final _formKey = GlobalKey<FormState>();

  var isInfoShown = false;

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
                        validator: (value) {
                          return null;
                        },
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        title: Constants.verifyLabel,
                        textColor: MyColors.whiteColor,
                        backgroundColor: MyColors.blackColor,
                        onPressed: () {
                          Navigator.pushNamed(context, LoginWelcomeScreen.tag);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    StatefulBuilder(builder: (context, myState) {
                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              title: Constants.resendLabel,
                              titleStyle: MyTextStyle.buttonTitle.copyWith(
                                  fontWeight: FontWeight.w600
                              ),
                              textColor: MyColors.blackColor,
                              backgroundColor: MyColors.whiteColor,
                              onPressed: () {
                                myState((){
                                  isInfoShown = true;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          if(isInfoShown)
                            const SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  Constants.resendTimerInfo,
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
