import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/intro_screen.dart';
import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_circular_progress_indicator.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWelcomeScreen extends StatelessWidget {
  const LoginWelcomeScreen({super.key});

  static const String tag = "login_welcome_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.blackColor,
        body: SizedBox(
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
      SizedBox(
        width: double.infinity,
        child: Text(
          Constants.titleLoginWelcomeScreen,
          textAlign: TextAlign.center,
          style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor
          ),
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Text(
        Constants.loginWelcomeScreenInfo,
        textAlign: TextAlign.center,
        style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Expanded(child: Container()),
      SizedBox(
        width: double.infinity,
        child: Builder(
          builder: (context) {
            var bloc = context.watch<LoginProvider>();

            if (bloc.loginModel?.data != null &&
                bloc.loginModel?.data?.token != null) {
              GlobalState.token = bloc.loginModel?.data?.token;

              Future.delayed(Duration.zero, () {
                Navigator.pushNamed(context,IntroScreen.tag);
              });
            } else if (bloc.isLoading == true) {
              return const MyCircularProgressIndicator();
            }
            return PrimaryButton(
              title: Constants.continueLabelLoginWelcomeScreen,
              textColor: MyColors.whiteColor,
              backgroundColor: MyColors.redColor,
              onPressed: () async {
                if(GlobalState.email!=null&& GlobalState.password!=null){
                  await bloc.setLoginModel(
                      context: context,
                      email: GlobalState.email!,
                      password: GlobalState.password!);

                }


              },
            );
          }
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ];
  }
}
