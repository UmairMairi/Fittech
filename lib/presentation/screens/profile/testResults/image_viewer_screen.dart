import 'package:fit_tech/logic/add_measurements_provider.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    child: Builder(builder: (context) {
                      var bloc = context.watch<AddMeasurementsProviders>();
                      return Text(
                        bloc.title ?? Constants.titleImageViewerScreen,
                        textAlign: TextAlign.center,
                        style: MyTextStyle.heading3
                            .copyWith(color: MyColors.whiteColor),
                      );
                    }),
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
              child: Builder(builder: (context) {
                var bloc = context.watch<AddMeasurementsProviders>();
                if (bloc.imageFile != null) {
                  return Image.file(
                    bloc.imageFile!,
                    width: double.infinity,
                  );
                } else {
                  return Container();
                }
              }),
            ),
            const SizedBox(
              height: 20.0,
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
                      Navigator.pop(context, false);
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
                        Navigator.pop(context, true);
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
