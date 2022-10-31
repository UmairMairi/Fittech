import 'package:fit_tech/data/models/intro_model.dart';
import 'package:fit_tech/presentation/screens/trainingTest/training_test_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/info_checks.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestimonialScreen extends StatefulWidget {
  const TestimonialScreen({super.key});

  static const String tag = "testimonial_screen";

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  var list = [
    IntroModel(image:Images.introImage1,title: Constants.introTitle1, info: Constants.introInfo1),
    IntroModel(image:Images.introImage2,title: Constants.introTitle2, info: Constants.introInfo2),
    IntroModel(image:Images.introImage3,title: Constants.introTitle3, info: Constants.introInfo3),
  ];

  var currentPageIndex = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: MyColors.blackColor,
                ),
                child: const Text(
                  Constants.titleTestimonial,
                  style: TextStyle(
                      fontFamily: 'Anton',
                      color: MyColors.whiteColor,
                      fontSize: 42.0),
                ),
              ),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.bottomCenter,
                  children: [
                    // const MyGridView(),
                    SingleChildScrollView(child: Image.asset(Images.testimonialScreen,fit: BoxFit.fitWidth,)),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              title: Constants.beginLabelTestimonial,
                              textColor: MyColors.whiteColor,
                              backgroundColor: MyColors.redColor,
                              borderColor: MyColors.redColor,
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
            ],
          ),
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
}
