import 'package:fit_tech/data/models/my_plans_list_model.dart';
import 'package:fit_tech/presentation/screens/dashboard/my_plans_screen.dart';
import 'package:fit_tech/presentation/screens/dashboard/nutrition_screen.dart';
import 'package:fit_tech/presentation/screens/dashboard/profile_screen.dart';
import 'package:fit_tech/presentation/screens/dashboard/store_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String tag = "dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> list = [];
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    list = [
      const MyPlansScreen(),
      const NutritionScreen(),
      Container(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: list[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: MyTextStyle.style.copyWith(
            color: (currentIndex !=2) ?MyColors.redColor:MyColors.blackColor,
            fontSize: 13,
          ),
          unselectedLabelStyle: MyTextStyle.style.copyWith(
            color: MyColors.blackColor,
            fontSize: 13,
          ),
          unselectedItemColor: MyColors.blackColor,
          selectedItemColor: MyColors.redColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if(index == 2){
              Navigator.pushNamed(context, StoreScreen.tag);
            }else{
              setState(() {
                currentIndex = index;
              });
            }
          },
          currentIndex: currentIndex,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.planUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.planChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Mi plan",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.nutritionUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.nutritionChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Nutrición",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.storeUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.storeUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Tienda",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.profileUnChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.profileChecked,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Mi cuenta",
            ),
          ],
        ),
      ),
    );
  }
}
