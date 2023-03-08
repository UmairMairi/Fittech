import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/test_result_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/string_extensions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  static const String tag = "contact_screen";

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var list = <ProfileModel>[
    ProfileModel(
        image: Images.profileScreenMyDataIcon,
        title: Constants.contactScreenInsta,
        route: MyDataScreen.tag),
    ProfileModel(
        image: Images.profileScreenPerformanceIcon,
        title: Constants.contactScreenFacebook,
        route: TestResultsScreen.tag),
    ProfileModel(
        image: Images.profileScreenResultsIcon,
        title: Constants.contactScreenCorreo,
        route: TestResultsScreen.tag),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        Constants.contactScreenTitle,
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
                        ListTile(
                          leading: ImageIcon(
                            AssetImage(list[index].image),
                            size: 20,
                            color: MyColors.blackColor,
                          ),
                          trailing: (index == (list.length - 1))
                              ? Text("info@fittech.com",style: MyTextStyle.paragraph1.copyWith(color: MyColors.greyColor),)
                              : const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: MyColors.greyColor,
                                  size: 18,
                                ),
                          title: Text(
                            list[index].title,
                            style: MyTextStyle.paragraph1,
                          ),
                          minLeadingWidth: 0.0,
                          onTap: () {
                            switch(list[index].title){
                              case Constants.contactScreenInsta:{
                                Contacts.instagram.openAsLink();
                                break;
                              }
                              case Constants.contactScreenFacebook:{
                                Contacts.facebook.openAsLink();
                                break;
                              }
                              case Constants.contactScreenCorreo:{
                                Contacts.facebook.openAsLink();
                                break;
                              }
                            }
                          },
                        ),
                        const Divider()
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
