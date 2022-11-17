import 'package:fit_tech/utils/colors.dart';
import 'package:flutter/material.dart';

class MyChipsList extends StatefulWidget {
  final String item;
  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;
  final ValueChanged<bool> currentValue;

  const MyChipsList(
      {required this.item,
        required this.selected,
        this.selectedColor = MyColors.blackColor,
        this.unselectedColor = MyColors.whiteColor,
        required this.currentValue,
        Key? key})
      : super(key: key);

  @override
  _MyChipsListState createState() => _MyChipsListState();
}

class _MyChipsListState extends State<MyChipsList> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.selected;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ChoiceChip(
        label: Text(
          widget.item,
          style: TextStyle(
              color: isSelected ? MyColors.whiteColor : MyColors.blackColor),
        ),
        selected: isSelected,
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        onSelected: (bool) {
          setState(() {
            isSelected = bool;
            widget.currentValue(bool);
          });
        },
        selectedColor: widget.selectedColor,
        backgroundColor: widget.unselectedColor,
        shape: StadiumBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? MyColors.whiteColor : MyColors.blackColor,
            )),
      ),
    );
  }
}