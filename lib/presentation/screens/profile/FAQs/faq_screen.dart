import 'package:fit_tech/presentation/screens/profile/FAQs/faq_details_screen.dart';
import 'package:fit_tech/presentation/widgets/shimmer.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../logic/faq_provider.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  static const String tag = "faq_screen";

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {

  FaqProvider faqProvider=FaqProvider();
  @override
  void initState() {
    super.initState();
    context.read<FaqProvider>().getFaqCategories(context: context);
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
            Builder(
              builder: (context) {
                var provider = context.watch<FaqProvider>();
                if(provider.faqCategoriesLoading) {
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
                    itemCount: provider.faqCategoriesModel?.data?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var list = provider.faqCategoriesModel?.data;
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, FAQDetailsScreen.tag, arguments:list?[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                        list?[index].name ?? "",
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
                    });
              }
            ),
          ],
        ),
      ),
    );
  }
}
