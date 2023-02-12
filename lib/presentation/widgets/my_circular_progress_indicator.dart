import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MyCircularProgressIndicator extends StatefulWidget {
  const MyCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  State<MyCircularProgressIndicator> createState() =>
      _MyCircularProgressIndicatorState();
}

class _MyCircularProgressIndicatorState
    extends State<MyCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: MyColors.blackColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: MyColors.blackColor),
          borderRadius: BorderRadius.circular(2.0),
        ),
        onPressed: () {},
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
        child: const Center(
          child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                  strokeWidth: 4, color: MyColors.whiteColor)),
        ));
  }
}
