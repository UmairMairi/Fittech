import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/settings/delete_acount_screen.dart';
import 'package:fit_tech/presentation/screens/profile/verify_identity_screen.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  static const String tag = "privacy_screen";

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.extraLightGreyColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: MyColors.whiteColor,
                child: Column(
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
                              Constants.privacyScreenTitle,
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
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, DeleteAccountScreen.tag);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                                  child: Row(
                                    children: const [
                                      Expanded(
                                          child: Text(
                                            Constants.privacyScreenLabel1,
                                            style: MyTextStyle.paragraph1,
                                          )),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: MyColors.greyColor,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15,)
                            ],
                          );

                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Constants.privacyScreenLabel1,
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color: MyColors.blackColor),
                                      )),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: MyColors.greyColor,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, DeleteAccountScreen.tag);
                                },

                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
