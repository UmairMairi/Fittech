import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/logic/profile/my_data_provider.dart';
import 'package:fit_tech/presentation/screens/profile/about_screen.dart';
import 'package:fit_tech/presentation/screens/profile/currentPerformance/current_performance_screen.dart';
import 'package:fit_tech/presentation/screens/profile/FAQs/faq_screen.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/settings/settings_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/test_result_screen.dart';
import 'package:fit_tech/presentation/screens/profile/training_notes_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String tag = "profile_screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var list = <ProfileModel>[
    ProfileModel(
        image: Images.profileScreenMyDataIcon,
        title: Constants.profileScreenMyDataTitle,
        route: MyDataScreen.tag),
    ProfileModel(
        image: Images.profileScreenPerformanceIcon,
        title: Constants.profileScreenCurrentPerformanceTitle,
        route: CurrentPerformanceScreen.tag),
    ProfileModel(
        image: Images.profileScreenResultsIcon,
        title: Constants.profileScreenResultsTitle,
        route: TestResultsScreen.tag),
    ProfileModel(
        image: Images.profileScreenNotesIcon,
        title: Constants.profileScreenNotesTitle,
        route: TrainingNotesScreen.tag),
    ProfileModel(
        image: Images.profileScreenFaqIcon,
        title: Constants.profileScreenFaqsTitle,
        route: FAQScreen.tag),
    ProfileModel(
        image: Images.profileScreenAboutIcon,
        title: Constants.profileScreenAboutTitle,
        route: AboutScreen.tag),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 66,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    Constants.profileScreenTitle,
                    style: MyTextStyle.style
                        .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SettingsScreen.tag);
                    },
                    constraints:
                        const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
                    alignment: Alignment.center,
                    icon: const ImageIcon(
                      AssetImage(Images.settingsIcon),
                      color: MyColors.blackColor,
                      size: 24,
                    ))
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 110,
                    width: 110,
                    // decoration: const BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   color: MyColors.greyColor,
                    // ),
                    child: SvgPicture.asset(
                      Images.iconProfileMyAccountScreen,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Builder(
                    builder: (context) {
                      var provider = context.watch<MyDataProvider>();
                      return Text(
                        "${provider.name} ${provider.lastName}",
                        style: MyTextStyle.style
                            .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                      );
                    }
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: MyColors.extraLightGreyColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        Images.profileScreenGoogleIcon,
                        height: 28.0,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Angel Castañeda",
                        style: MyTextStyle.inputTitle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  color: MyColors.extraLightGreyColor,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: MyColors.whiteColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Image.asset(
                                Images.actualPlanIcon,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                Constants.profileScreenAboutTitleManual,
                                style: MyTextStyle.heading3
                                    .copyWith(color: MyColors.redColor),
                              ),
                              const Text(
                                Constants.profileScreenAboutTitleInfoManual,
                                style: MyTextStyle.inputTitle,
                              ),
                            ],
                          )
                        ],
                      )),
                      const VerticalDivider(
                        width: 3,
                        color: MyColors.redColor,
                      ),
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Image.asset(
                                Images.totalIcon,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "24",
                                style: MyTextStyle.heading3
                                    .copyWith(color: MyColors.blackColor),
                              ),
                              const Text(
                                Constants.profileScreenAboutTitleInfoRutine,
                                style: MyTextStyle.inputTitle,
                              ),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  color: MyColors.extraLightGreyColor,
                ),
                ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: ImageIcon(
                              AssetImage(list[index].image),
                              size: 20,
                              color: MyColors.blackColor,
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: MyColors.greyMediumColor,
                              size: 18,
                            ),
                            title: Text(
                              list[index].title,
                              style: MyTextStyle.paragraph1,
                            ),
                            minLeadingWidth: 0.0,
                            onTap: () {
                              Navigator.pushNamed(context, list[index].route);
                            },
                          ),
                          if (index != (list.length - 1)) const Divider()
                        ],
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
