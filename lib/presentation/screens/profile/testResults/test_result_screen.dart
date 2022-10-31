import 'package:fit_tech/presentation/screens/profile/testResults/health_indicator_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/measurements_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/today_workout_home.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:flutter/material.dart';

class TestResultsScreen extends StatefulWidget {
  const TestResultsScreen({super.key});

  static const String tag = "test_result_screen";

  @override
  State<TestResultsScreen> createState() => _TestResultsScreenState();
}

class _TestResultsScreenState extends State<TestResultsScreen>
    with TickerProviderStateMixin {
  List<String>? tabNames;
  List<Widget>? tabWidgets;
  TabController? _controller;
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabNames = ["Indicadores de salud", "Mis medidas"];
    tabWidgets = [const HealthIndicatorsScreen(), const MeasurementsScreen()];
    _controller = TabController(length: tabNames!.length, vsync: this);
    _controller?.addListener(() {
      setState(() {
        selectedIndex = _controller!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
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
                          Constants.titleVerifyCodeScreen,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Open Sance',
                              color: MyColors.blackColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
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
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelStyle: const TextStyle(
                        fontFamily: 'Open Sance',
                        color: MyColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0),
                    tabs: tabNames!.map((item) {
                      return Tab(
                        height: 50.0,
                        child: Text(item,
                            style: const TextStyle(
                                fontFamily: 'Open Sance',
                                color: MyColors.blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0)),
                      );
                    }).toList(),
                    controller: _controller!,
                    indicatorColor: Colors.black,
                    padding: EdgeInsets.zero,
                    labelStyle: const TextStyle(fontSize: 12.0),
                  ),
                  Expanded(child: tabWidgets![selectedIndex])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
