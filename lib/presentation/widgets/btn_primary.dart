import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final double? titleSize;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isLeading;
  final Color borderColor;
  final Widget? leadingChild;
  final Widget? trailingChild;
  final bool enabled;
  final EdgeInsetsGeometry? padding;


  const PrimaryButton({
    super.key,
    required this.title,
    this.titleSize = 18.0,
    this.onPressed,
    this.titleStyle,
    this.backgroundColor = MyColors.whiteColor,
    this.textColor = MyColors.blackColor,
    this.isLeading = false,
    this.enabled = true,
    this.borderColor = MyColors.blackColor,
    this.leadingChild,
    this.trailingChild,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: RawMaterialButton(
        fillColor: backgroundColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(2.0),
        ),
        onPressed: enabled ? onPressed : null,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
        child: Padding(
          padding: padding??const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leadingChild != null) leadingChild!,
              Text(
                title,
                style: titleStyle ??
                    MyTextStyle.buttonTitle.copyWith(color: textColor),
              ),
              if (trailingChild != null) trailingChild!,
            ],
          ),
        ),
      ),
    );
  }
}
