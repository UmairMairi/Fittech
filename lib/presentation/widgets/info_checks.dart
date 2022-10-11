import 'package:fit_tech/utils/colors.dart';
import 'package:flutter/material.dart';

class InfoChecks extends StatelessWidget {
  final String title;
  final Color titleColor;

  const InfoChecks({super.key,required this.title,this.titleColor = MyColors.whiteColor});


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
            child: const Icon(Icons.done_rounded,color: MyColors.whiteColor,size: 20,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Open Sance',
                  fontSize: 16.0,
                  color: titleColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
