import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/test_result_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class TrainingNotesScreen extends StatefulWidget {
  const TrainingNotesScreen({super.key});

  static const String tag = "training_notes_screen";

  @override
  State<TrainingNotesScreen> createState() => _TrainingNotesScreenState();
}

class _TrainingNotesScreenState extends State<TrainingNotesScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap:true,
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
                      Constants.trainingNotesScreenTitle,
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
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(child: Text(
                              "22 de Ago 2022",
                              style: MyTextStyle.paragraph1,
                            )),
                            Container(
                              padding: const EdgeInsets.all(6),
                              margin: const EdgeInsets.symmetric(horizontal:10),
                              decoration: const BoxDecoration(color: MyColors.blackColor,
                              shape: BoxShape.circle),
                              child:Center(child: Text(index.toString(),style: TextStyle(color: Colors.white),)),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded,size: 18,)
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
