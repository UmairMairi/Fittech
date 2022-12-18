import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/data/models/settings_model.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/settings/Privacy_screen.dart';
import 'package:fit_tech/presentation/screens/profile/settings/current_plan_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/test_result_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String tag = "settings_screen";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var list = [
    SettingsModel(
        title: Constants.settingsScreenLabel1, route: CurrentPlanScreen.tag),
    SettingsModel(
        title: Constants.settingsScreenLabel2, route: PrivacyScreen.tag),
    SettingsModel(title: Constants.settingsScreenLabel3, route: "")
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
                      Constants.settingsScreenTitle,
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
            ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (index == (list.length - 1)) {
                            showDialogue(context: context, category: Profile.logout);
                          } else {
                            Navigator.pushNamed(context, list[index].route);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
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

  showDialogue({required BuildContext context, required Profile category}) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ProfileDialogue(category: category);
        });
  }
}
