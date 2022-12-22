import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageSource extends StatelessWidget {
  final Function()? onCamera;
  final Function()? onGallery;
  const ImageSource({super.key,this.onCamera,this.onGallery});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: MyColors.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  Constants.titleImageSource,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Open Sance',
                      color: MyColors.blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: MyColors.blackColor,
                  size: 20,
                ),
                constraints:
                    const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
            title: Constants.btnCameraTitleImageSource,
            backgroundColor: MyColors.blackColor,
            textColor: MyColors.whiteColor,
            borderColor: MyColors.blackColor,
            onPressed: () {
              if(onCamera!=null){
                onCamera!();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
            title: Constants.btnGalleryTitleImageSource,
            backgroundColor: MyColors.whiteColor,
            textColor: MyColors.blackColor,
            borderColor: MyColors.blackColor,
            onPressed: () {
              if(onGallery!=null){
                onGallery!();
              }
            },
          ),
        ],
      ),
    );
  }
}
