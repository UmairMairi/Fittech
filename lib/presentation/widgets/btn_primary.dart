import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final double? titleSize;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isLeading;
  final Color borderColor;

  const PrimaryButton({
    super.key,
    required this.title,
    this.titleSize = 18.0,
    this.onPressed,
    this.backgroundColor = MyColors.whiteColor,
    this.textColor = MyColors.blackColor,
    this.isLeading = false,
    this.borderColor = MyColors.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: backgroundColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(2.0),
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              fontFamily:'Open Sance',
              fontSize: titleSize,fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
