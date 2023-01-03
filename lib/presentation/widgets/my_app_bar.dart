import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final Color? backgroundColor;

  const MyAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 65.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: MyColors.blackColor,
              size: 24.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: MyTextStyle.heading3,
            ),
          ),
          Opacity(
            opacity: 0.0,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: MyColors.blackColor,
                size: 24.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
