import 'package:fit_tech/data/models/profile_model.dart';
import 'package:fit_tech/presentation/screens/profile/FAQs/faq_details_screen.dart';
import 'package:fit_tech/presentation/screens/profile/my_data_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/test_result_screen.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/faqData/FaqCategories.dart';
import '../../../../logic/faq_provider.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  static const String tag = "faq_screen";

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {

  FaqProvider faqProvider=FaqProvider();
  List<CategoryData> categoryList=[];
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
                  const Expanded(
                    child: Text(
                      "Preguntas frecuentes",
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
                itemCount: categoryList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, FAQDetailsScreen.tag,arguments:categoryList[index] );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "Ejemplo de categoría $index",
                                style: MyTextStyle.paragraph1,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: MyColors.greyColor,
                                size: 18,
                              )
                            ],
                          ),
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
  getData() async {
    var model = await faqProvider.getFaqCategories(context: context);
    if (model != null) {
      setState(() {
        categoryList = faqProvider.faqCategoriesModel?.data ?? [];
      });
    }
  }
}
