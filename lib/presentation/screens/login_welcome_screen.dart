import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginWelcomeScreen extends StatelessWidget {
  const LoginWelcomeScreen({super.key});

  static const String tag = "login_welcome_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: size.height>size.width?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: childrenList(context: context),
            )
            :ListView(
              children:  childrenList(context: context),
            ),
          ),
        ),
      ),
    );
  }

  childrenList({required BuildContext context}){
    return <Widget>[
      Expanded(child: Container()),
      Image.asset(
        'assets/images/icon_done.png',
        height: 100,
      ),
      const SizedBox(
        height: 30.0,
      ),
      const SizedBox(
        width: double.infinity,
        child: Text(
          Constants.titleLoginWelcomeScreen,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Anton',
              color: MyColors.whiteColor,
              fontSize: 42.0),
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
      const Text(
        Constants.loginWelcomeScreenInfo,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Open Sance',
            color: MyColors.whiteColor,
            fontSize: 18.0),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Expanded(child: Container()),
      SizedBox(
        width: double.infinity,
        child: PrimaryButton(
          title: Constants.continueLabelLoginWelcomeScreen,
          textColor: MyColors.whiteColor,
          backgroundColor: MyColors.redColor,
          onPressed: (){
            Navigator.pushNamed(context,SubscribePlanScreen.tag);
          },
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ];
  }
}
