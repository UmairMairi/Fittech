import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/test_result_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/faqData/FaqCategories.dart';
import '../../../../data/models/faqData/FaqQuestions.dart';
import '../../../../logic/faq_provider.dart';
import '../../../../utils/singlton.dart';

class FAQDetailsScreen extends StatefulWidget {
  const FAQDetailsScreen({super.key});

  static const String tag = "faq_details_screen";

  @override
  State<FAQDetailsScreen> createState() => _FAQDetailsScreenState();
}

class _FAQDetailsScreenState extends State<FAQDetailsScreen> {
  FaqProvider faqProvider=FaqProvider();
  List<QuestionData> questionList=[];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

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
                   Expanded(
                    child: Text(
                      questionList[0].category?.name ?? "",
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
                itemCount: questionList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var isExpanded = false;
                  return StatefulBuilder(builder: (context, myState) {
                    return Column(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            title: Text(
                              questionList[index].question ?? "",
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: isExpanded
                                      ? MyColors.redColor
                                      : MyColors.blackColor),
                            ),
                            onExpansionChanged: (val) {
                              myState(() {
                                isExpanded = val;
                              });
                            },
                            iconColor: MyColors.redColor,
                            children: [getContent( questionList[index].answer ?? "")],
                          ),
                        ),
                        const Divider(height: 5,)
                      ],
                    );
                  });
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Row(
                          children: const [
                            Expanded(
                                child: Text(
                              "Ejemplo de pregunta",
                              style: MyTextStyle.paragraph1,
                            )),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: MyColors.greyColor,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      const Divider()
                    ],
                  );
                }),
          ],
        ),
      ),
    );

  }

  Widget getContent(String detail) {
    return Theme(
      data: Theme.of(context),
      child: Column(
        children: [
          const Divider(height: 1,),
          Container(
            padding: const EdgeInsets.all(20.0),
            child:  Text(detail, style: MyTextStyle.text1,
            ),
          ),
        ],
      ),
    );
  }
  getData() async {
    var model = await faqProvider.getFaqQuestions(context: context, id: Singleton.pressedCategoryId.toString());
    if (model != null) {
      setState(() {
        questionList = faqProvider.faqQuestionsModel?.data ?? [];
      });
    }
  }
}
