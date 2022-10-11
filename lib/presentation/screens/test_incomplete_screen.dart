import 'package:fit_tech/presentation/screens/subscribe_plan_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class TestIncompleteScreen extends StatelessWidget {
  const TestIncompleteScreen({super.key});

  static const String tag = "test_incomplete_screen";

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
      Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child:const Icon(
              Icons.arrow_back,
              color: MyColors.blackColor,
              size: 24.0,
            ),
          ),
        ),
      ),
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
          Constants.titleTestInCompleteScreen,
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
        Constants.testInCompleteScreenInfo,
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
          title: Constants.continueLabelInCompleteScreen,
          textColor: MyColors.whiteColor,
          backgroundColor: MyColors.redColor,
          onPressed: (){
          },
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ];
  }
}
