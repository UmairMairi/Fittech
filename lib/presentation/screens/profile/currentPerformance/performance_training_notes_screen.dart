import 'package:fit_tech/data/models/my_plans_list_model.dart';
import 'package:fit_tech/presentation/screens/active_gym_screen.dart';
import 'package:fit_tech/presentation/screens/active_outdoor_screen.dart';
import 'package:fit_tech/presentation/screens/dialogue/add_note_dialogue.dart';
import 'package:fit_tech/presentation/screens/today_training_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TrainingNotesDetailScreen extends StatefulWidget {
  const TrainingNotesDetailScreen({super.key});

  static const String tag = "training_notes_detail_screen";

  @override
  State<TrainingNotesDetailScreen> createState() =>
      _TrainingNotesDetailScreenState();
}

class _TrainingNotesDetailScreenState
    extends State<TrainingNotesDetailScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.lightGreyColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: MyColors.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            Constants.performanceTrainingNotesScreenTitle,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                          child: Text(
                                        'NOTA# 123123:',
                                        style: MyTextStyle.heading3,
                                      )),
                                      PopupMenuButton<int>(
                                        constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
                                        icon: const Icon(Icons.more_horiz,),
                                        onSelected: (val){
                                          if(val == 1){
                                            showDialogue(context: context);
                                          }
                                        },
                                        onCanceled: (){},
                                        itemBuilder: (context) => [
                                          const PopupMenuItem(
                                            value: 1,
                                            textStyle: MyTextStyle.text1,
                                            height: 25,
                                            child: Text(
                                              "Editar Nota",
                                              style: MyTextStyle.paragraph1,
                                            ),
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.greyMediumColor,
                                            width: 1)),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: MyColors.greyColor,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Expanded(
                                            child: Text(
                                          'Escalada de Montana',
                                          style: MyTextStyle.heading3,
                                        ))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Text(
                                    'FITTECH, es una aplicación virtual con uso en Colombia; con fundamento en lo dispuesto en la Constitución Política de Colombia, la Ley 1266 de 2008.',
                                    style: MyTextStyle.paragraph1,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            if (index == 0) const Divider()
                          ],
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogue({required BuildContext context}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(child: AddNoteDialogue()),
          );
        });
  }
}
