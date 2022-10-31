import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/presentation/screens/testimonial_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const String tag = "intro_screen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var list = [
    IntroModel(
        image: Images.introImage1,
        title: Constants.introTitle1,
        info: Constants.introInfo1),
    IntroModel(
        image: Images.introImage2,
        title: Constants.introTitle2,
        info: Constants.introInfo2),
    IntroModel(
        image: Images.introImage3,
        title: Constants.introTitle3,
        info: Constants.introInfo3),
  ];

  var currentPageIndex = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                list[currentPageIndex].image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.width,
                            width: size.width,
                          ),
                          Expanded(
                            child: PageView(
                              allowImplicitScrolling: true,
                              scrollDirection: Axis.horizontal,
                              controller: controller,
                              onPageChanged: (index) {
                                setState(() {
                                  currentPageIndex = index;
                                });
                              },
                              children: funPagerValue(list),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        title: Constants.continueLabelIntroScreen,
                        textColor: MyColors.blackColor,
                        backgroundColor: MyColors.whiteColor,
                        onPressed: () {
                          if (currentPageIndex != list.length - 1) {
                            controller.jumpToPage(currentPageIndex + 1);
                          } else {
                            Navigator.pushNamed(context, TestimonialScreen.tag);
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 0.5,
                    color: MyColors.whiteColor,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: Constants.skipLabelIntroScreen,
                      textColor: MyColors.whiteColor,
                      backgroundColor: MyColors.blackColor,
                      onPressed: () {
                        Navigator.pushNamed(context, TrainingTestScreen.tag);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < this.list.length; i++) {
      list.add(i == currentPageIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    print("currentPageIndex ===== $currentPageIndex");
    return SizedBox(
      height: 15,
      width: 15,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: MyColors.redColor.withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? MyColors.redColor : MyColors.whiteColor,
        ),
      ),
    );
  }

  List<Widget> funPagerValue(List<IntroModel> list) {
    return list.map((item) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              textAlign: TextAlign.start,
              style: MyTextStyle.heading2.copyWith(color: MyColors.whiteColor),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              item.info,
              textAlign: TextAlign.start,
              style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
            ),
          ],
        ),
      );
    }).toList();
  }
}
