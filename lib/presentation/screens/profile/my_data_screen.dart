import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/dialogue/cadence_pause.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
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

class MyDataScreen extends StatefulWidget {
  const MyDataScreen({super.key});

  static const String tag = "my_data_screen";

  @override
  State<MyDataScreen> createState() => _MyDataScreenState();
}

class _MyDataScreenState extends State<MyDataScreen> {

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
                        Constants.myDataScreenTitle,
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
                    const SizedBox(height: 20,),
                    Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: const PrimaryButton(
                        title: Constants.myDataScreenUpdatePhoto,
                        backgroundColor: MyColors.whiteColor,
                        textColor: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 20,
                      color: MyColors.extraLightGreyColor,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            showDialogue(context: context,category: Profile.name);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Row(
                              children: [
                                Expanded(child: Text(
                                  Constants.myDataScreenName, style: MyTextStyle
                                    .paragraph1.copyWith(color: MyColors.blackColor),)),
                                Expanded(child: Text(
                                  "Angle",
                                  textAlign: TextAlign.end,
                                  style:MyTextStyle.paragraph1.copyWith(color: Colors.grey),))
                              ],
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Row(
                              children: [
                                Expanded(child: Text(
                                  Constants.myDataScreenLastName, style: MyTextStyle
                                    .paragraph1.copyWith(color: MyColors.blackColor),)),
                                Expanded(child: Text(
                                  "Castañeda",
                                  textAlign: TextAlign.end,
                                  style:MyTextStyle.paragraph1.copyWith(color: Colors.grey),))
                              ],
                            ),
                          ),
                          onTap: (){
                            showDialogue(context: context,category: Profile.lastName);
                          },
                        ),
                        const Divider()
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Row(
                              children: [
                                Expanded(child: Text(
                                  Constants.myDataScreenMail, style: MyTextStyle
                                    .paragraph1.copyWith(color: MyColors.blackColor),)),
                                Text(
                                  "ejemplo@gmail.com",
                                  textAlign: TextAlign.end,
                                  style:MyTextStyle.paragraph1.copyWith(color: Colors.grey),)
                              ],
                            ),
                          ),
                          onTap: (){
                            showDialogue(context: context,category: Profile.email);
                          },
                        ),
                        const Divider()
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Row(
                              children: [
                                Expanded(child: Text(
                                  Constants.myDataScreenGander, style: MyTextStyle
                                    .paragraph1.copyWith(color: MyColors.blackColor),)),
                                Expanded(child: Text(
                                  "Hombre",
                                  textAlign: TextAlign.end,
                                  style:MyTextStyle.paragraph1.copyWith(color: Colors.grey),))
                              ],
                            ),
                          ),
                          onTap: (){
                            showDialogue(context: context,category: Profile.gender);
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                      color: MyColors.extraLightGreyColor,
                    ),
                    ListTile(
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: MyColors.greyMediumColor,
                        size: 20,
                      ),
                      title: const Text(
                        Constants.myDataScreenUpdatePassword,
                        style: MyTextStyle.paragraph1,
                      ),
                      minLeadingWidth: 0.0,
                      onTap: () {
                        Navigator.pushNamed(context, VerifyIdentityScreen.tag);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  showDialogue({required BuildContext context,required Profile category}){
    showModalBottomSheet<void>(context: context, builder: (BuildContext context){
      return ProfileDialogue(category: category);
    });
  }
}

enum Profile {name,lastName,email,gender,updatePassword}
