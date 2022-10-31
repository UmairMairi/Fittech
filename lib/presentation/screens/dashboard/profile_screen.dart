import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

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
        route: MyDataScreen.tag),
    ProfileModel(
        image: Images.profileScreenResultsIcon,
        title: Constants.profileScreenResultsTitle,
        route: MyDataScreen.tag),
    ProfileModel(
        image: Images.profileScreenNotesIcon,
        title: Constants.profileScreenNotesTitle,
        route: MyDataScreen.tag),
    ProfileModel(
        image: Images.profileScreenFaqIcon,
        title: Constants.profileScreenFaqsTitle,
        route: MyDataScreen.tag),
    ProfileModel(
        image: Images.profileScreenAboutIcon,
        title: Constants.profileScreenAboutTitle,
        route: MyDataScreen.tag),
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
                const Expanded(
                  child: Text(
                    Constants.profileScreenTitle,
                    style: MyTextStyle.heading2,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    constraints:
                        const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
                    alignment: Alignment.center,
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: MyColors.blackColor,
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
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.greyColor,
                  ),
                ),
                const Text(
                  "Angel Castañeda",
                  style: MyTextStyle.heading2,
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
                    children: [
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Image.asset(
                              Images.actualPlanIcon,
                              height: 40,
                              width: 40,
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
                            child: Image.asset(
                              Images.totalIcon,
                              height: 40,
                              width: 40,
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
                              size: 24,
                              color: MyColors.blackColor,
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: MyColors.greyMediumColor,
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
