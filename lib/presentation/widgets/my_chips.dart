import 'package:fit_tech/presentation/widgets/shimmer.dart';
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
        onSelected: (bool bool) {
          setState(() {
            isSelected = bool;
            print(bool);
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

class ShimmerChoiceChips extends StatelessWidget {
  const ShimmerChoiceChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 1; i <= 10; i++)
          Shimmer.fromColors(
              // ignore: sort_child_properties_last
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: ChoiceChip(
                  label: Text(
                    " load ",
                    style: TextStyle(color: MyColors.blackColor),
                  ),
                  padding:  EdgeInsets.symmetric(
                      horizontal: 2.0, vertical: 10.0),
                  selected: true,
                ),
              ),
              baseColor: MyColors.shimmerBaseColor,
              highlightColor: MyColors.shimmerHighlightColor),
      ],
    );
  }
}
