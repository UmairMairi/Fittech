import 'package:fit_tech/logic/add_measurements_provider.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/measurements_screen.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class AddMeasurementsScreen extends StatelessWidget {
  final MeasurementsType type;

  const AddMeasurementsScreen({super.key, required this.type});

  static const String tag = "add_measurements_screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            (type == MeasurementsType.addNew)
              ?Column(
                children: [
                  SizedBox(
                    height: 65.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: MyColors.blackColor,
                            size: 24.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Expanded(
                          child: Text(
                            Constants.nutritionAddMeasurementsScreenTitle,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.heading3,
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
                  const LinearProgressIndicator(
                    minHeight: 5,
                    backgroundColor: MyColors.lightGreyColor,
                    value: 0.666,
                    valueColor: AlwaysStoppedAnimation<Color>(MyColors.redColor),
                  ),
                ],
              ):
            SizedBox(
              height: 65.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: MyColors.blackColor,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      (type == MeasurementsType.history)
                          ? "20 Ago 2022"
                          : Constants.addMeasurementsScreenTitle,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading3,
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
                child: MeasurementsScreen(
              type: type,
            ))
          ],
        ),
      ),
    );
  }
}
