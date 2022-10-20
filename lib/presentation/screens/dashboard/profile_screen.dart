import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/data/models/profile_model.dart';
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
        title: Constants.profileScreenMyDataTitle),
    ProfileModel(
        image: Images.profileScreenPerformanceIcon,
        title: Constants.profileScreenCurrentPerformanceTitle),
    ProfileModel(
        image: Images.profileScreenResultsIcon,
        title: Constants.profileScreenResultsTitle),
    ProfileModel(
        image: Images.profileScreenNotesIcon,
        title: Constants.profileScreenNotesTitle),
    ProfileModel(
        image: Images.profileScreenFaqIcon,
        title: Constants.profileScreenFaqsTitle),
    ProfileModel(
        image: Images.profileScreenAboutIcon,
        title: Constants.profileScreenAboutTitle)
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
                      color: MyColors.lightGreyColor,
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
                  color: MyColors.lightGreyColor,
                ),
                Container(
                  height: 100,
                  color: MyColors.whiteColor,
                ),
                Container(
                  height: 20,
                  color: MyColors.lightGreyColor,
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
                            trailing: const Icon(Icons.arrow_forward_ios_rounded,color: MyColors.greyMediumColor,),
                            title: Text(list[index].title,style: MyTextStyle.paragraph1,),
                            minLeadingWidth: 0.0,
                            onTap: (){},
                          ),
                          if(index != (list.length-1))
                            const Divider()
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
