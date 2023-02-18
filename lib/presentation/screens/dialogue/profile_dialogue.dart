import 'package:fit_tech/logic/create_account_provider.dart';
import 'package:fit_tech/logic/delete_account_provider.dart';
import 'package:fit_tech/logic/profile/my_data_provider.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_loading.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileDialogue extends StatelessWidget {
  final Profile category;
  final String inputText;
  final Function(String)? onChange;

   const ProfileDialogue({super.key,
    this.category = Profile.name,
    this.inputText = "",
    this.onChange});


  @override
  Widget build(BuildContext context) {

    final TextEditingController controller =
    TextEditingController(text: inputText);
    var selected = 0;

    if(category == Profile.gender){
      if(inputText == "Hombre"){
        selected = 0;
      }else{
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
                  getName(category),
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
          category != Profile.gender
              ? category == Profile.deleteAccount
              ? const Text(
            Constants.deleteAccountDialogueInfo,
            style: MyTextStyle.paragraph1,
          )
              : category == Profile.logout
              ? const Text(
            Constants.closeSessionDialogueInfo,
            style: MyTextStyle.paragraph1,
          )
              : TextFieldPrimary(
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
                  title: ((category != Profile.deleteAccount) &&
                      (category != Profile.logout))
                      ? Constants.ProfileDialogueButtonCancel
                      : Constants.deleteAccountDialogueButtonLabel1,
                  backgroundColor: MyColors.whiteColor,
                  textColor: Colors.black,
                  borderColor: MyColors.blackColor,
                  enabled: true,
                  onPressed: () {
                    if ((category != Profile.deleteAccount) && (category != Profile.logout)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    var provider =  context.watch<MyDataProvider>();
                    var deleteAccountProvider =  context.watch<DeleteAccountProvider>();
                    var registerProvider =  context.watch<RegisterProvider>();
                    if(provider.isLoading || deleteAccountProvider.isLoading|| registerProvider.isLoading){
                      return const LoadingButton();
                    }
                    return PrimaryButton(
                      title: ((category != Profile.deleteAccount) &&
                          (category != Profile.logout))
                          ? Constants.ProfileDialogueButtonSave
                          : Constants.deleteAccountDialogueButtonLabel2,
                      backgroundColor: MyColors.blackColor,
                      textColor: MyColors.whiteColor,
                      borderColor: MyColors.blackColor,
                      enabled: true,
                      onPressed: () async {
                        if(category == Profile.deleteAccount){
                          await context.read<DeleteAccountProvider>().deleteAccount(context: context, token: Singleton.userToken!);
                        }else if(category == Profile.logout){
                          await context.read<RegisterProvider>().logoutUser(context: context);
                        } else if ((category != Profile.deleteAccount) && (category != Profile.logout) && onChange != null) {
                          if (category == Profile.gender) {
                            (selected == 0)
                                ? onChange!("Hombre")
                                :onChange!("Mujer");
                          }else{
                            switch(category){
                              case Profile.name:{
                                await context.read<MyDataProvider>().updateProfileData(context: context, firstName:controller.text.toString());
                                break;}
                              case Profile.lastName:{
                                await context.read<MyDataProvider>().updateProfileData(context: context, lastName:controller.text.toString());
                                break;}
                              case Profile.email:{
                                await context.read<MyDataProvider>().updateProfileData(context: context, email:controller.text.toString());
                                break;}
                              default:{}
                            }
                            onChange!(controller.text.toString());
                          }
                          Navigator.pop(context);
                        }

                      },
                    );
                  }
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
    } else if (cat == Profile.coupon) {
      return Constants.couponDialogueName;
    }
  }

}
