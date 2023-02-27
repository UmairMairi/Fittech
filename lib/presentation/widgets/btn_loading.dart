import 'package:fit_tech/utils/colors.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final bool? isLeading;
  final Color borderColor;
  final Color progressColor;

  const LoadingButton({
    super.key,
    this.onPressed,
    this.backgroundColor = MyColors.blackColor,
    this.isLeading = false,
    this.borderColor = Colors.transparent,
    this.progressColor = MyColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: backgroundColor,
      elevation: 0.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
      hoverElevation: 0.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(2.0),
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Center(child: SizedBox(
          height: 20,
          width: 20,
            child: CircularProgressIndicator(color: progressColor,strokeWidth: 2.0,)),),
      ),
    );
  }
}
