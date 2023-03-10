import 'package:fit_tech/utils/colors.dart';
import 'package:flutter/material.dart';

class InfoChecks extends StatelessWidget {
  final String title;
  final Widget? richTextChild;
  final Color titleColor;
  final Color iconColor;

  const InfoChecks(
      {super.key,
      required this.title,
      this.richTextChild,
      this.titleColor = MyColors.whiteColor,
      this.iconColor = MyColors.whiteColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.blackColor),
                borderRadius: BorderRadius.circular(5.0)),
            child: Icon(
              Icons.done_rounded,
              color: iconColor,
              size: 20,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: richTextChild ?? Text(
                title,
                style: TextStyle(
                  fontFamily: 'Open Sance',
                  fontSize: 16.0,
                  color: titleColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
