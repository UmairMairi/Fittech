import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final Color selectedColor;
  final Color unselectedColor;
  final bool showUnit;
  final String unit;
  final ValueChanged<int>? onChange;

  const CounterWidget(
      {this.selectedColor = MyColors.blackColor,
      this.unselectedColor = MyColors.whiteColor,
      this.showUnit =false,
      this.unit ="gr.",
      this.onChange,
      Key? key})
      : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  var count = 0;

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
                  if(widget.onChange!=null){
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
            child: Column(
              children: [
                Text(
                  "$count",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if(widget.showUnit)
                  Text(
                    widget.unit,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                count++;
                if(widget.onChange!=null){
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
