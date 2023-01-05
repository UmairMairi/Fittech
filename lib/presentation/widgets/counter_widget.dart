import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterWidget extends StatefulWidget {
  final Color selectedColor;
  final Color unselectedColor;
  final bool showUnit;
  final String unit;
  final ValueChanged<int>? onChange;

  const CounterWidget(
      {this.selectedColor = MyColors.blackColor,
      this.unselectedColor = MyColors.whiteColor,
      this.showUnit = false,
      this.unit = "gr.",
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  var count = 0;
  final TextEditingController valueController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: MyColors.lightGreyColor)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (count > 0) {
                  count--;
                  valueController.text = "$count";
                  if (widget.onChange != null) {
                    widget.onChange!(count);
                  }
                }
              });
            },
            child: Container(
              height: 30.0,
              width: 30.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: MyColors.lightGreyColor),
              child: const Text(
                "-",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 40,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        count = int.parse(value);
                      });
                    },
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    controller: valueController,
                    scrollPadding: EdgeInsets.zero,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                        constraints:
                            BoxConstraints(minHeight: 0.0, minWidth: 0.0),
                        contentPadding: EdgeInsets.zero,
                        hintText: "0",
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // if(widget.showUnit)
                  //   Text(
                  //     widget.unit,
                  //   style: const TextStyle(fontSize: 8),
                  // ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                count++;
                valueController.text = "$count";
                if (widget.onChange != null) {
                  widget.onChange!(count);
                }
              });
            },
            child: Container(
              height: 30.0,
              width: 30.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: MyColors.blackColor),
              child: const Text(
                "+",
                style: TextStyle(fontSize: 20, color: MyColors.whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
