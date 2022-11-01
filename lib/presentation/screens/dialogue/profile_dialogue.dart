import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class ProfileDialogue extends StatelessWidget {
  final Profile category;

  const ProfileDialogue({super.key, this.category = Profile.name});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    var selected = 0;
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
                  getName(category),
                  textAlign: TextAlign.start,
                  style: MyTextStyle.heading3
                      .copyWith(color: MyColors.blackColor),
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
          category != Profile.gender
              ?category == Profile.deleteAccount
              ?const Text(Constants.deleteAccountDialogueInfo,style: MyTextStyle.paragraph1,)
              :category == Profile.logout
              ?const Text(Constants.closeSessionDialogueInfo,style: MyTextStyle.paragraph1,)
              :TextFieldPrimary(
              isLabelRequired: true,
              title: getName(category),
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
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
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
                  title: ((category != Profile.deleteAccount)&&(category != Profile.logout))
                      ?Constants.ProfileDialogueButtonCancel
                      :Constants.deleteAccountDialogueButtonLabel1,
                  backgroundColor: MyColors.whiteColor,
                  textColor: Colors.black,
                  borderColor: MyColors.blackColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PrimaryButton(
                  title: ((category != Profile.deleteAccount)&&(category != Profile.logout))
                      ?Constants.ProfileDialogueButtonSave
                      :Constants.deleteAccountDialogueButtonLabel2
                  ,
                  backgroundColor: MyColors.blackColor,
                  textColor: MyColors.whiteColor,
                  borderColor: MyColors.blackColor,
                ),
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
    }
  }
}
