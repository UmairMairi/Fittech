import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogueCadence extends StatelessWidget {
  const DialogueCadence({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: MyColors.whiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    Constants.dialogueCadenceTitle,
                    textAlign: TextAlign.start,
                    style: MyTextStyle.heading3,
                  ),
                ),
                IconButton(
                  onPressed: () {},
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

            const Text(
              Constants.dialogueCadenceInfo,
              textAlign: TextAlign.start,
              style: MyTextStyle.paragraph1,
            ),
          ],
        ),
      ),
    );
  }
}
