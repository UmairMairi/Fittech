import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/widgets/TextFieldPrimary.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class FoodDialogue extends StatefulWidget {
  const FoodDialogue({super.key});

  @override
  State<FoodDialogue> createState() => _FoodDialogueState();
}

class _FoodDialogueState extends State<FoodDialogue> {
  @override
  Widget build(BuildContext context) {
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
                  Constants.titleFoodDialogue,
                  textAlign: TextAlign.start,
                  style:
                      MyTextStyle.heading3.copyWith(color: MyColors.blackColor),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context,false);
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(Constants.infoFoodDialogue,style: MyTextStyle.paragraph1,),
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Constants.label1FoodDialogue,style: MyTextStyle.normal.copyWith(fontSize: 15,color: MyColors.greyColor),),
                        const SizedBox(height: 10,),
                        const Text(Constants.label1ValueFoodDialogue,style: MyTextStyle.paragraph1,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Constants.label2FoodDialogue,style: MyTextStyle.normal.copyWith(fontSize: 15,color: MyColors.greyColor),),
                        const SizedBox(height: 10,),
                        const Text(Constants.label2ValueFoodDialogue,style: MyTextStyle.paragraph1,),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20.0,),
          PrimaryButton(
            title: Constants.btnLabelFoodDialogue,
            backgroundColor: MyColors.redColor,
            textColor: MyColors.whiteColor,
            borderColor: MyColors.redColor,
            onPressed: (){
              Navigator.pop(context,true);
            },
          )
        ],
      ),
    );
  }

}
