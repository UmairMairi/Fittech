import 'dart:async';

import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/create_account_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/register_screen.dart';
import 'package:fit_tech/presentation/screens/profile/about/privacy_policy_screen.dart';
import 'package:fit_tech/presentation/screens/profile/about/terms_conditions_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../data/models/on_boarding_model/login_model.dart';
import '../../../utils/pref_utils.dart';
import '../../../utils/singlton.dart';
import '../dashboard/dashboard_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String tag = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _controller;

  @override
   initState()  {
    super.initState();
    _controller = VideoPlayerController.asset(Images.welcomeBackgroundVideo);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    PrefUtils.getString(key: PrefUtils.loginModel).then((value){
      if(value!=null ){
        if(value.isNotEmpty){
          if (kDebugMode) {
            print(value);
          }
          var result = loginModelFromJson(value);
          Singleton.userToken = result.data?.token;
          Singleton.userModel = result;
          context.read<LoginProvider>().loginModel = Singleton.userModel;
          _controller.dispose();
          Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.tag, (route) => false);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            VideoPlayer(_controller),
            Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Images.appLogo,
                      height: 30,
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          onPressed: () {
                            _controller.dispose();
                            Navigator.pushNamed(context, RegisterScreen.tag).then((value){
                              _controller = VideoPlayerController.asset(Images.welcomeBackgroundVideo);
                              _controller.addListener(() {
                                setState(() {});
                              });
                              _controller.setLooping(true);
                              _controller.initialize().then((_) => setState(() {}));
                              _controller.play();
                            });
                          },
                          title: Constants.createAccount),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: () {
                          _controller.dispose();
                          Navigator.pushNamed(context, LoginScreen.tag).then((value){
                            _controller = VideoPlayerController.asset(Images.welcomeBackgroundVideo);
                            _controller.addListener(() {
                              setState(() {});
                            });
                            _controller.setLooping(true);
                            _controller.initialize().then((_) => setState(() {}));
                            _controller.play();
                          });
                        },
                        title: Constants.login,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "${Constants.agreeTermsConditionsInfo}\n",
                          style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                          children: <TextSpan>[
                            TextSpan(
                                text: Constants.termsConditions,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, TermsConditionsScreen.tag);
                                  },
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.whiteColor)),
                            const TextSpan(
                                text: " y ",
                                style: TextStyle(color: MyColors.whiteColor)),
                            TextSpan(
                                text: "${Constants.privacyPolicy}.",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, PrivacyPolicyScreen.tag);
                                  },
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.whiteColor)),
                          ]),
                    )
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
