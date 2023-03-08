import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/logic/create_account_provider.dart';
import 'package:fit_tech/logic/delete_account_provider.dart';
import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/logic/profile/my_data_provider.dart';
import 'package:fit_tech/presentation/screens/onBoarding/welcome_screen.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_loading.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/context_extentions.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDialogue extends StatefulWidget {
  final Profile category;
  final String inputText;
  final Function(String)? onChange;

  ProfileDialogue(
      {super.key,
      this.category = Profile.name,
      this.inputText = "",
      this.onChange});

  @override
  State<ProfileDialogue> createState() => _ProfileDialogueState();
}

class _ProfileDialogueState extends State<ProfileDialogue> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = widget.inputText;
  }

  @override
  Widget build(BuildContext context) {
    var selected = 0;

    if (widget.category == Profile.gender) {
      if (widget.inputText.toLowerCase() == "hombre") {
        selected = 0;
      } else {
        selected = 1;
      }
    }
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: MyColors.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  getName(widget.category),
                  textAlign: TextAlign.start,
                  style:
                      MyTextStyle.heading3.copyWith(color: MyColors.blackColor),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: MyColors.blackColor,
                  size: 20,
                ),
                constraints:
                    const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          widget.category != Profile.gender
              ? widget.category == Profile.deleteAccount
                  ? const Text(
                      Constants.deleteAccountDialogueInfo,
                      style: MyTextStyle.paragraph1,
                    )
                  : widget.category == Profile.logout
                      ? const Text(
                          Constants.closeSessionDialogueInfo,
                          style: MyTextStyle.paragraph1,
                        )
                      : TextFieldPrimary(
                          isLabelRequired: true,
                          title: getName(widget.category),
                          isObscure: false,
                          controller: controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {}
                            return null;
                          },
                          keyboardType: TextInputType.name)
              : StatefulBuilder(builder: (context, myState) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              myState(() {
                                selected = 0;
                              });
                              (selected == 0)
                                  ? widget.onChange!("Hombre")
                                  : widget.onChange!("Mujer");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Hombre",
                                    style: MyTextStyle.paragraph1
                                        .copyWith(color: MyColors.blackColor),
                                  )),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (selected == 0)
                                                ? MyColors.redColor
                                                : MyColors.greyColor,
                                            width: (selected == 0) ? 5 : 1)),
                                  )
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
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Mujer",
                                    style: MyTextStyle.paragraph1
                                        .copyWith(color: MyColors.blackColor),
                                  )),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (selected == 1)
                                                ? MyColors.redColor
                                                : MyColors.greyColor,
                                            width: (selected == 1) ? 5 : 1)),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              myState(() {
                                selected = 1;
                              });
                            },
                          ),
                          const Divider()
                        ],
                      ),
                    ],
                  );
                }),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  title: ((widget.category != Profile.deleteAccount) &&
                          (widget.category != Profile.logout))
                      ? Constants.ProfileDialogueButtonCancel
                      : Constants.deleteAccountDialogueButtonLabel1,
                  backgroundColor: MyColors.whiteColor,
                  textColor: Colors.black,
                  borderColor: MyColors.blackColor,
                  enabled: true,
                  onPressed: () {
                    if ((widget.category != Profile.deleteAccount) &&
                        (widget.category != Profile.logout)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Builder(builder: (context) {
                  var provider = context.watch<MyDataProvider>();
                  var deleteAccountProvider =
                      context.watch<DeleteAccountProvider>();
                  var registerProvider = context.watch<RegisterProvider>();
                  if (provider.isLoading ||
                      deleteAccountProvider.isLoading ||
                      registerProvider.isLoading) {
                    return const LoadingButton();
                  }
                  return PrimaryButton(
                      title: ((widget.category != Profile.deleteAccount) &&
                              (widget.category != Profile.logout))
                          ? Constants.ProfileDialogueButtonSave
                          : Constants.deleteAccountDialogueButtonLabel2,
                      backgroundColor: MyColors.blackColor,
                      textColor: MyColors.whiteColor,
                      borderColor: MyColors.blackColor,
                      enabled: true,
                      onPressed: () async {
                        if (widget.category == Profile.deleteAccount) {
                          await context
                              .read<DeleteAccountProvider>()
                              .deleteAccount(context: context, token: Singleton.userToken!);
                        }
                        else if (widget.category == Profile.logout) {
                          var model = await context
                              .read<RegisterProvider>()
                              .logoutUser(context: context);
                          if (model is SuccessResponseGeneric) {
                            if (!context.mounted) return;
                            PrefUtils.clear();
                            Navigator.pushNamedAndRemoveUntil(
                                context, WelcomeScreen.tag, (route) => false);
                          }
                        }
                        else if ((widget.category != Profile.deleteAccount) && (widget.category != Profile.logout) && widget.onChange != null) {
                          // if (category == Profile.gender) {
                          //   (selected == 0)
                          //       ? onChange!("Hombre")
                          //       : onChange!("Mujer");
                          // }
                          // else {
                          switch (widget.category) {
                            case Profile.name:
                              {
                                await context
                                    .read<MyDataProvider>()
                                    .updateProfileData(
                                        context: context,
                                        firstName: controller.text.toString(),
                                        onSuccess: (val) {
                                          if (val != null) {
                                            Provider.of<LoginProvider>(context, listen: false).setLoginModel(model: val);
                                            Navigator.pop(context);
                                          }
                                        });
                                break;
                              }
                            case Profile.lastName:
                              {
                                await context
                                    .read<MyDataProvider>()
                                    .updateProfileData(
                                        context: context,
                                        lastName: controller.text.toString(),
                                        onSuccess: (val) {
                                          if (val != null) {
                                            Provider.of<LoginProvider>(context,
                                                    listen: false)
                                                .setLoginModel(model: val);
                                            Navigator.pop(context);
                                          }
                                        });
                                break;
                              }
                            case Profile.email:
                              {
                                await context
                                    .read<MyDataProvider>()
                                    .updateProfileData(
                                        context: context,
                                        email: controller.text.toString(),
                                        onSuccess: (val) {
                                          if (val != null) {
                                            Provider.of<LoginProvider>(context,
                                                    listen: false)
                                                .setLoginModel(model: val);
                                            Navigator.pop(context);
                                          }
                                        });
                                break;
                              }
                            case Profile.gender:
                              {
                                await context
                                    .read<MyDataProvider>()
                                    .updateProfileData(
                                        context: context,
                                        gender: (selected == 0) ? "Hombre" : "Mujer",
                                        onSuccess: (val) {
                                          if (val != null) {
                                            Provider.of<LoginProvider>(context,
                                                    listen: false)
                                                .setLoginModel(model: val);
                                            Navigator.pop(context);
                                           }
                                        });
                                break;
                              }
                            default:
                              {}
                          }
                          widget.onChange!(controller.text.toString());
                        }
                      });
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  getName(Profile cat) {
    if (cat == Profile.name) {
      return Constants.myDataScreenName;
    } else if (cat == Profile.lastName) {
      return Constants.myDataScreenLastName;
    } else if (cat == Profile.email) {
      return Constants.myDataScreenMail;
    } else if (cat == Profile.gender) {
      return Constants.myDataScreenGander;
    } else if (cat == Profile.name) {
      return Constants.myDataScreenName;
    } else if (cat == Profile.deleteAccount) {
      return Constants.deleteAccountDialogueLabel;
    } else if (cat == Profile.logout) {
      return Constants.closeSessionDialogueLabel;
    } else if (cat == Profile.coupon) {
      return Constants.couponDialogueName;
    }
  }
}
