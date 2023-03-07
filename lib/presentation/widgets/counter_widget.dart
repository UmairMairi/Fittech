import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../logic/recipe/recipe_provider.dart';

class CounterWidget extends StatefulWidget {
  final Color selectedColor;
  final Color unselectedColor;
  final bool showUnit;
  final bool isEditable;
  final String unit;
        int counter;
        int? index;
  final ValueChanged<int>? onChange;

   CounterWidget(
      {this.selectedColor = MyColors.blackColor,
      this.unselectedColor = MyColors.whiteColor,
      this.showUnit = false,
      this.isEditable = true,
      this.unit = "gr.",
      this.onChange,
      this.counter = 1,
      this.index,
      Key? key})
      : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  var count = 1;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // count = widget.counter;
    // textController.text = "$count";
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        RecipeProvider provider = context.read<RecipeProvider>();
        textController.text = "${provider.selectedFood[widget.index!].quantity}";
        return Container(
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), border: Border.all(color: MyColors.lightGreyColor)),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                    if (provider.selectedFood[widget.index!].quantity > 1) {
                      provider.minusQuantity(widget.index); 
                      textController.text = "${provider.selectedFood[widget.index!].quantity}";
                      if (widget.onChange != null) {
                        widget.onChange!(count);
                      }
                    }
                },
                child: Opacity(
                  opacity: (count == 0)?0.5:1,
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      !widget.isEditable
                          ? Text(
                        "${provider.selectedFood[widget.index!].quantity}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                          :TextFormField(
                        textAlign: TextAlign.center,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        controller: textController,
                        onChanged: (val){
                          if(val.isNotEmpty){
                            setState(() {
                              count = int.parse(val);
                            });
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                      if (widget.showUnit)
                        Text(
                          widget.unit,
                          style: const TextStyle(fontSize: 12),
                        ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if(count<999){                    
                      provider.addQuantity(widget.index);
                      textController.text = "${provider.selectedFood[widget.index!].quantity}";
                      if (widget.onChange != null) {
                        widget.onChange!(count);
                      }
                  }
                },
                child: Opacity(
                  opacity: (count == 999) ? 0.5 : 1,
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: MyColors.blackColor),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 20, color: MyColors.whiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
