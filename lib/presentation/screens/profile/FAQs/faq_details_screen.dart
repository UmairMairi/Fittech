import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/faqData/FaqCategories.dart';
import '../../../../data/models/faqData/FaqQuestions.dart';
import '../../../../logic/faq_provider.dart';

class FAQDetailsScreen extends StatefulWidget {
  final CategoryData? category;

  const FAQDetailsScreen({super.key, this.category});

  static const String tag = "faq_details_screen";

  @override
  State<FAQDetailsScreen> createState() => _FAQDetailsScreenState();
}

class _FAQDetailsScreenState extends State<FAQDetailsScreen> {
  FaqProvider faqProvider = FaqProvider();
  List<QuestionData> questionList = [];
  CategoryData? data;

  @override
  void initState() {
    super.initState();
    data = widget.category;

    print("==================${data?.toJson()}=========================");
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
                  const Expanded(
                    child: Text(
                      "Categoría 1",
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
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
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
                            children: [getContent()],
                          ),
                        ),
                        const Divider(
                          height: 5,
                        )
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

  Widget getContent() {
    return Theme(
      data: Theme.of(context),
      child: Column(
        children: [
          const Divider(
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: MyTextStyle.text1,
            ),
          ),
        ],
      ),
    );
  }

  getData(String categoryId) async {
    var model =
        await faqProvider.getFaqQuestions(context: context, id: categoryId);
    if (model != null) {
      setState(() {
        questionList = faqProvider.faqQuestionsModel?.data ?? [];
      });
    }
  }
}
