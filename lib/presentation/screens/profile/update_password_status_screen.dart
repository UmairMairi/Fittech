import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:flutter/material.dart';

class UpdatePasswordStatusScreen extends StatelessWidget {
  const UpdatePasswordStatusScreen({super.key});

  static const String tag = "update_password_status_screen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context,NavigationResults.passwordUpdated);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.blackColor,
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: size.height > size.width
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: childrenList(context: context),
                    )
                  : ListView(
                      children: childrenList(context: context),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  childrenList({required BuildContext context}) {
    return <Widget>[
      Expanded(child: Container()),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
            color: MyColors.redColor, shape: BoxShape.circle),
        child: const Icon(Icons.lock,size: 60,color: MyColors.whiteColor,),
      ),
      const SizedBox(
        height: 30.0,
      ),
      SizedBox(
        width: double.infinity,
        child: Text(
          Constants.passwordUpdateScreenTitle,
          textAlign: TextAlign.center,
          style: MyTextStyle.heading1.copyWith(color: MyColors.whiteColor),
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Text(
        Constants.passwordUpdateScreenInfo,
        textAlign: TextAlign.center,
        style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Expanded(child: Container()),
      SizedBox(
        width: double.infinity,
        child: PrimaryButton(
          title: Constants.passwordUpdateScreenContinueLabel,
          textColor: MyColors.whiteColor,
          backgroundColor: MyColors.redColor,
          borderColor: MyColors.redColor,
          onPressed: () {
            PrefUtils.clear();
            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
          },
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ];
  }
}
