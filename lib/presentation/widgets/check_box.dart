import 'package:fit_tech/utils/colors.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final String? title;
  final bool? isChecked;
  final ValueChanged<bool>? valueChanged;

  const MyCheckBox({
    Key? key,
    required this.title,
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
                border: Border.all(color: MyColors.blackColor),
                borderRadius: BorderRadius.circular(5.0)),
            child: Checkbox(
              activeColor: MyColors.whiteColor.withAlpha(0),
              checkColor: MyColors.blackColor,
              tristate: false,
              value: state,
              side: BorderSide(color: MyColors.blackColor.withAlpha(0),),
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
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Text(widget.title!,style: const TextStyle(
                fontFamily: 'Open Sance',
                fontSize: 18.0,
                color: MyColors.blackColor,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
