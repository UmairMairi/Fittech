import 'package:fit_tech/data/models/about_model.dart';
import 'package:fit_tech/presentation/screens/about/privacy_policy_screen.dart';
import 'package:fit_tech/presentation/screens/about/terms_conditions_screen.dart';
import 'package:fit_tech/presentation/screens/profile/app_founder_screen.dart';
import 'package:fit_tech/presentation/screens/profile/contact_screen.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  static const String tag = "about_screen";

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  var list = [
    AboutModel(title: Constants.aboutScreenLabel1,route: AppFounderScreen.tag),
    AboutModel(title: Constants.aboutScreenLabel2,route: PrivacyPolicyScreen.tag),
    AboutModel(title: Constants.aboutScreenLabel3,route: TermsConditionsScreen.tag),
    AboutModel(title: Constants.aboutScreenLabel4,route: ContactScreen.tag)
  ];
  @override
  void initState() {
    super.initState();
  }

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
                      Constants.aboutScreenTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Open Sance',
                          color: MyColors.blackColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
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
            ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, list[index].route);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(child: Text(
                                list[index].title,
                                style: MyTextStyle.paragraph1,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: MyColors.greyColor,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Divider()
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
