import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final String image;
  final double? titleSize;
  final Color? backgroundColor;
  final Color? textColor;

  const SecondaryButton({
    super.key,
    required this.title,
    required this.image,
    this.titleSize = 18.0,
    this.onPressed,
    this.backgroundColor = MyColors.whiteColor,
    this.textColor = MyColors.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: backgroundColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: MyColors.blackColor),
        borderRadius: BorderRadius.circular(2.0),
      ),
      onPressed: onPressed,
      padding: const EdgeInsets.all( 5.0),
      constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
      child: Row(
        children: [
          Container(
              height: 40.0,
              width: 40.0,
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(image)),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily:'Open Sance',
                color: textColor, fontSize: titleSize,),
            ),
          ),
          const SizedBox(
              height: 40.0,
              width: 40.0,),
        ],
      ),
    );
  }
}
