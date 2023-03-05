import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class MyGridViewSmall extends StatefulWidget {
  const MyGridViewSmall({super.key, this.title,required this.onChange});

  final String? title;
  final onChange;

  @override
  State<MyGridViewSmall> createState() => _MyGridViewSmallState();
}

class _MyGridViewSmallState extends State<MyGridViewSmall> {
  var selectedIndex = -1;

  var list = [
    "<9","11-13","17","21-25","26-28","31-33","36-38",">41"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            setState((){
              selectedIndex = index;
            });
            widget.onChange(selectedIndex,"${list[index]}%");
          },
          child: Container(
            color: (selectedIndex==index)?MyColors.redColor:MyColors.extraLightGreyColor,
            child: Column(
              children: [
                Image.asset("assets/images/icon_fat_percentage${list[index]}.png"),
                Text("${list[index]}% graso",style: MyTextStyle.heading3.copyWith(
                  color: (selectedIndex==index)?MyColors.whiteColor:MyColors.blackColor,
                ),)
              ],
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (size.height > size.width) ? 2 : 4,
          childAspectRatio: 1 / 1.4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
