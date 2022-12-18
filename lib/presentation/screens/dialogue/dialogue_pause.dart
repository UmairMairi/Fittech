import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class DialoguePause extends StatelessWidget {
  final Function()? onPause;
  final Function()? onRestart;
  final Function()? onExit;
  const DialoguePause({super.key,this.onPause,this.onRestart,this.onExit,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: MyColors.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  Constants.dialoguePauseTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Open Sance',
                      color: MyColors.blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0),
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
          PrimaryButton(
            title: Constants.dialoguePauseContinueLabel,
            backgroundColor: MyColors.blackColor,
            textColor: MyColors.whiteColor,
            borderColor: MyColors.blackColor,
            onPressed: () {
              if(onPause!=null){
                onPause!();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
            title: Constants.dialoguePauseRestartLabel,
            backgroundColor: MyColors.whiteColor,
            textColor: MyColors.blackColor,
            borderColor: MyColors.blackColor,
            onPressed: () {
              if(onRestart!=null){
                onRestart!();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
            title: Constants.dialoguePauseExitLabel,
            backgroundColor: MyColors.whiteColor,
            textColor: MyColors.blackColor,
            borderColor: MyColors.blackColor,
            onPressed: () {
              if(onExit!=null){
                onExit!();
              }
            },
          ),
        ],
      ),
    );
  }
}
