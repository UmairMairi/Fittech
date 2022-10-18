import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final String? title;
  final Widget? child;
  final bool? isChecked;
  final ValueChanged<bool>? valueChanged;

  const MyCheckBox({
    Key? key,
    this.title,
    this.child,
    this.isChecked,
    this.valueChanged,
  }) : super(key: key);

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool state = false;

  @override
  void initState() {
    super.initState();
    state = widget.isChecked!;
  }

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
                color: state ? MyColors.redColor : MyColors.whiteColor,
                border: Border.all(
                  color: state ? MyColors.redColor : MyColors.blackColor,
                ),
                borderRadius: BorderRadius.circular(5.0)),
            child: Checkbox(
              activeColor: MyColors.whiteColor.withAlpha(0),
              checkColor: MyColors.whiteColor,
              tristate: false,
              value: state,
              side: BorderSide(
                color: MyColors.blackColor.withAlpha(0),
              ),
              onChanged: (bool) {
                setState(() {
                  state = bool!;
                });
                widget.valueChanged!(state);
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: widget.child ??
                Text(
                  widget.title!,
                  style: MyTextStyle.paragraph1,
                ),
          ))
        ],
      ),
    );
  }
}
