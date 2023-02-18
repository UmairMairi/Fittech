import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/logic/profile/my_data_provider.dart';
import 'package:fit_tech/presentation/screens/dialogue/profile_dialogue.dart';
import 'package:fit_tech/presentation/screens/profile/verify_identity_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                            var bloc = context.watch<LoginProvider>();
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: CachedNetworkImage(
                                imageUrl: bloc.loginModel?.data?.userProfile
                                        ?.profileImageUrl ??
                                    "",
                                placeholder: (context, url) => SvgPicture.asset(
                                  Images.iconProfileMyAccountScreen,
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    SvgPicture.asset(
                                  Images.iconProfileMyAccountScreen,
                                  fit: BoxFit.cover,
                                ),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Builder(builder: (context) {
                            var bloc = context.watch<MyDataProvider>();

                            return Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: PrimaryButton(
                                title: Constants.myDataScreenUpdatePhoto,
                                backgroundColor: MyColors.whiteColor,
                                textColor: Colors.black,
                                onPressed: () async {
                                  var file = await bloc.pickImageFromGallery(
                                      context: context);
                                  if (file != null) {
                                    await bloc.updateProfileImage(
                                        context: context,
                                        onSuccess: (val) {
                                          if (val != null) {
                                            Provider.of<LoginProvider>(context,
                                                    listen: false)
                                                .setLoginModel(model: val);
                                          }
                                        });
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
                                      inputText: context
                                              .read<LoginProvider>()
                                              .loginModel
                                              ?.data
                                              ?.userProfile
                                              ?.user
                                              ?.firstName ??
                                          "");
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
                                            context.read<LoginProvider>();
                                        return Expanded(
                                            child: Text(
                                          bloc.loginModel?.data?.userProfile
                                                  ?.user?.firstName ??
                                              "",
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
                                            context.watch<LoginProvider>();
                                        return Expanded(
                                            child: Text(
                                          bloc.loginModel?.data?.userProfile
                                                  ?.user?.lastName ??
                                              "",
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
                                          .read<LoginProvider>()
                                        .loginModel?.data?.userProfile?.user?.lastName ?? "");
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
                                            context.watch<LoginProvider>();
                                        return Text(
                                          bloc.loginModel?.data?.userProfile
                                                  ?.user?.email ??
                                              "",
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
                                      inputText: context
                                          .read<LoginProvider>().loginModel?.data
                                              ?.userProfile?.user?.email ??
                                          "");
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
                                        child: Builder(
                                          builder: (context) {
                                            var bloc = context.watch<LoginProvider>();
                                            return Text(
                                              bloc.loginModel?.data?.userProfile?.gender ?? "",
                                              textAlign: TextAlign.end,
                                              style: MyTextStyle.paragraph1
                                                  .copyWith(
                                                      color:
                                                          MyColors.greyColor),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  showDialogue(
                                      context: context,
                                      category: Profile.gender,
                                      inputText:context.read<LoginProvider>().loginModel?.data?.userProfile?.gender ?? "",);
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
