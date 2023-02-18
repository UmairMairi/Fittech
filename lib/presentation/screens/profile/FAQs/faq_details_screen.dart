import 'package:fit_tech/presentation/widgets/shimmer.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/faqData/FaqCategories.dart';
import '../../../../data/models/faqData/FaqQuestions.dart';
import '../../../../logic/faq_provider.dart';
import '../../../../utils/singlton.dart';

class FAQDetailsScreen extends StatefulWidget {
  final CategoryData? category;

  const FAQDetailsScreen({super.key, this.category});

  static const String tag = "faq_details_screen";

  @override
  State<FAQDetailsScreen> createState() => _FAQDetailsScreenState();
}

class _FAQDetailsScreenState extends State<FAQDetailsScreen> {
  CategoryData? data;

  @override
  void initState() {
    super.initState();

    data = widget.category;
    if (kDebugMode) {
      print("==================${data?.toJson()}=========================");
    }

    context.read<FaqProvider>().getFaqQuestions(context: context, id: data?.id.toString() ?? "");
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
                      data?.name ?? "",
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
            Builder(
              builder: (context) {
                var provider = context.watch<FaqProvider>();
                if(provider.faqQuestionsLoading){
                  return ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          highlightColor: MyColors.shimmerHighlightColor,
                          baseColor: MyColors.shimmerBaseColor,
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20),
                                  child: Row(
                                    children: const [
                                      Expanded(
                                          child: Text(
                                            "Ejemplo de categoría",
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
                            ),
                          ),
                        );
                      });
                }
                return ListView.builder(
                    itemCount: provider.faqQuestionsModel?.data?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var list = provider.faqQuestionsModel?.data;
                      var isExpanded = false;
                      return StatefulBuilder(builder: (context, myState) {
                        return Column(
                          children: [
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  list?[index].question ?? "",
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
                                children: [
                                  getContent(list?[index].answer ?? "")
                                ],
                              ),
                            ),
                            const Divider(
                              height: 5,
                            )
                          ],
                        );
                      });
                    },
                );
              }
            ),
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
          const Divider(
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(detail, style: MyTextStyle.text1,textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
