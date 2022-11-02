import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class AddNoteDialogue extends StatelessWidget {
  const AddNoteDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
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
                  "Agregar nota",
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
          TextFieldPrimary(
              isLabelRequired: true,
              title: 'Escribir nota',
              isObscure: false,
              controller: controller,
              lines: 8,
              validator: (value) {
                if (value == null || value.isEmpty) {}
                return null;
              },
              keyboardType: TextInputType.name),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: const [
              Expanded(
                child: PrimaryButton(
                  title: Constants.ProfileDialogueButtonCancel,
                  backgroundColor: MyColors.whiteColor,
                  textColor: Colors.black,
                  borderColor: MyColors.blackColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: PrimaryButton(
                  title: Constants.ProfileDialogueButtonSave,
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
