import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatelessWidget {
  static const String tag = "image_viewer_screen";

  const ImageViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.blackColor,
        body: Column(
          children: [
            SizedBox(
              height: 65.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: MyColors.whiteColor,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      Constants.titleImageViewerScreen,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading3
                          .copyWith(color: MyColors.whiteColor),
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: MyColors.blackColor,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    Constants.infoBodyMassScreen,
                    style: MyTextStyle.paragraph1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  Images.detailsBodyMassScreen,
                  width: double.infinity,
                ),
              ]),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    title: Constants.btn1ImageViewerScreen,
                    backgroundColor: MyColors.blackColor,
                    textColor: MyColors.whiteColor,
                    borderColor: MyColors.whiteColor,
                    enabled: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: PrimaryButton(
                      title: Constants.btn2ImageViewerScreen,
                      backgroundColor: MyColors.whiteColor,
                      textColor: MyColors.blackColor,
                      borderColor: MyColors.whiteColor,
                      enabled: true,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
