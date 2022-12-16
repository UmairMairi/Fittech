import 'package:fit_tech/data/models/nutrition_training_model.dart';
import 'package:fit_tech/logic/nutrition/fat_Percentage_provider.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/measurements_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/biological_gender_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_chips.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/grid_view_fat_percentage.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_measurements_scren.dart';

class FatPercentageScreen extends StatefulWidget {
  static const String tag = "fat_percentage_screen";

  const FatPercentageScreen({super.key});

  @override
  State<FatPercentageScreen> createState() => _FatPercentageScreenState();
}

class _FatPercentageScreenState extends State<FatPercentageScreen> {
  var selectedIndex = -1;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,()async{
      selectedIndex = context.read<FatPercentageProvider>().setSelectItem(val: selectedIndex);
    });
    return SafeArea(
      child: Scaffold(
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
                      color: MyColors.blackColor,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      Constants.faTPercentageScreenTitle1,
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
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        Constants.faTPercentageScreenTitle2,
                        textAlign: TextAlign.start,
                        style: MyTextStyle.heading2,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyGridViewSmall(
                        onChange: (val) {
                          selectedIndex = val;
                          context.read<FatPercentageProvider>().setSelectItem(val: selectedIndex);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Builder(
                        builder: (context) {
                          var bloc = context.watch<FatPercentageProvider>();
                          bool isEnabled = false;
                          if((bloc.selectedItem!=null && bloc.selectedItem!=-1)||Singleton.isDev){
                            isEnabled = true;
                          }
                          return PrimaryButton(
                            title: Constants.chooseTrainingModeContinueLabel,
                            backgroundColor: MyColors.blackColor,
                            textColor: MyColors.whiteColor,
                            enabled: isEnabled,
                            onPressed: () {
                              if(selectedIndex!=-1){
                                Navigator.pushNamed(
                                    context, AddMeasurementsScreen.tag,
                                    arguments: true);
                              }
                            },
                          );
                        }
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
