import 'package:fit_tech/logic/profile/my_data_provider.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/verify_identity_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var provider = context.read<MyDataProvider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: MyColors.whiteColor,
                  child: const MyAppBar(
                    title: Constants.myDataScreenTitle,
                  )),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration:
                          const BoxDecoration(color: MyColors.whiteColor),
                      child: Column(
                        children: [
                          Builder(builder: (context) {
                            var bloc = context.watch<MyDataProvider>();
                            return Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyColors.greyColor,
                              ),
                              child:
                                  (bloc.myDataScreenModel?.data?.profileImage !=
                                              null &&
                                          bloc.myDataScreenModel?.data != null)
                                      ? CircleAvatar(
                                          foregroundImage: NetworkImage(
                                          ApiConstants.baseUrl +
                                              bloc.myDataScreenModel!.data!
                                                  .profileImage!,
                                        ))
                                      : Image.asset(
                                          Images.profileScreenProfileIcon),
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Builder(builder: (context) {
                            var bloc = context.watch<MyDataProvider>();

                            String imagePath = bloc.imageFile.toString();
                            return Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: PrimaryButton(
                                title: Constants.myDataScreenUpdatePhoto,
                                backgroundColor: MyColors.whiteColor,
                                textColor: Colors.black,
                                onPressed: () async {
                                  await bloc.pickImageFromGallery(
                                      context: context);

                                  Map<String, String> filePath = {
                                    "profile_image": imagePath
                                  };
                                  await bloc.setChangeProfileImageInMap(
                                      context: context, filePath: filePath);
                                  if (bloc.changeProfileImageInMap?[
                                              "message"] ==
                                          "Updated Successfully" &&
                                      bloc.changeProfileImageInMap?[
                                              'success'] ==
                                          true) {
                                    await bloc.setMyDataScreenModel(
                                        context: context);
                                  }
                                },
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration:
                          const BoxDecoration(color: MyColors.whiteColor),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialogue(
                                      context: context,
                                      category: Profile.name,
                                      inputText:
                                          context.read<MyDataProvider>().name);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Constants.myDataScreenName,
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color: MyColors.blackColor),
                                      )),
                                      Builder(builder: (context) {
                                        var bloc =
                                            context.watch<MyDataProvider>();
                                        return Expanded(
                                            child: Text(
                                          bloc.name,
                                          textAlign: TextAlign.end,
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: MyColors.greyColor),
                                        ));
                                      })
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Constants.myDataScreenLastName,
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color: MyColors.blackColor),
                                      )),
                                      Builder(builder: (context) {
                                        var bloc =
                                            context.watch<MyDataProvider>();
                                        return Expanded(
                                            child: Text(
                                          bloc.lastName,
                                          textAlign: TextAlign.end,
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: MyColors.greyColor),
                                        ));
                                      })
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  showDialogue(
                                      context: context,
                                      category: Profile.lastName,
                                      inputText: context
                                          .read<MyDataProvider>()
                                          .lastName);
                                },
                              ),
                              const Divider()
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Constants.myDataScreenMail,
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color: MyColors.blackColor),
                                      )),
                                      Builder(builder: (context) {
                                        var bloc =
                                            context.watch<MyDataProvider>();
                                        return Text(
                                          bloc.email,
                                          textAlign: TextAlign.end,
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: MyColors.greyColor),
                                        );
                                      })
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  showDialogue(
                                      context: context,
                                      category: Profile.email,
                                      inputText:
                                          context.read<MyDataProvider>().email);
                                },
                              ),
                              const Divider()
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Constants.myDataScreenGander,
                                        style: MyTextStyle.paragraph1.copyWith(
                                            color: MyColors.blackColor),
                                      )),
                                      Expanded(
                                          child: Builder(builder: (context) {
                                        var bloc =
                                            context.watch<MyDataProvider>();
                                        return Text(
                                          bloc.gender,
                                          textAlign: TextAlign.end,
                                          style: MyTextStyle.paragraph1
                                              .copyWith(
                                                  color: MyColors.greyColor),
                                        );
                                      }))
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  showDialogue(
                                      context: context,
                                      category: Profile.gender,
                                      inputText: context
                                          .read<MyDataProvider>()
                                          .gender);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration:
                          const BoxDecoration(color: MyColors.whiteColor),
                      child: ListTile(
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: MyColors.greyMediumColor,
                          size: 18,
                        ),
                        title: const Text(
                          Constants.myDataScreenUpdatePassword,
                          style: MyTextStyle.paragraph1,
                        ),
                        minLeadingWidth: 0.0,
                        onTap: () {
                          Navigator.pushNamed(
                              context, VerifyIdentityScreen.tag);
                        },
                      ),
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

  showDialogue(
      {required BuildContext context,
      required Profile category,
      String inputText = ""}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ProfileDialogue(
              category: category,
              inputText: inputText,
              onChange: (val) {
                switch (category) {
                  case Profile.name:
                    {
                      context.read<MyDataProvider>().setName(val: val);
                    }
                    break;
                  case Profile.lastName:
                    {
                      context.read<MyDataProvider>().setLastName(val: val);
                    }
                    break;
                  case Profile.email:
                    {
                      context.read<MyDataProvider>().setEmail(val: val);
                    }
                    break;
                  case Profile.gender:
                    {
                      context.read<MyDataProvider>().setGender(val: val);
                    }
                    break;
                  default:
                    {}
                }
              },
            ),
          );
        });
  }
}

enum Profile {
  name,
  lastName,
  email,
  gender,
  updatePassword,
  deleteAccount,
  logout,
  coupon
}
