import 'package:fit_tech/logic/choose_date_provider.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/comparison_measurements_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/presentation/widgets/my_app_bar.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseDatesScreen extends StatelessWidget {
  static const String tag = "choose_dates_screen";

  const ChooseDatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = -1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          children: [
            const MyAppBar(
              title: Constants.titleChooseDatesScreen,
            ),
            SizedBox(
              height: 70,
              child: Column(
                children: [
                  const Divider(
                    height: 1,
                  ),
                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          child: Builder(
                            builder: (context) {
                              var bloc = context.watch<ChooseDateProviders>();
                              return bloc.dates.isNotEmpty
                                  ?Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: MyColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "29 Ago 2022",
                                      textAlign: TextAlign.center,
                                      style: MyTextStyle.heading3,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                                  :Container();
                            }
                          ),
                        ),
                      ),
                      const SizedBox(height: 68, child: VerticalDivider()),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          child: Builder(
                            builder: (context) {
                              var bloc = context.watch<ChooseDateProviders>();
                              return (bloc.dates.length==2)
                                  ?Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: MyColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(
                                        child: Text(
                                      textAlign: TextAlign.center,
                                      "29 Ago 2022",
                                      style: MyTextStyle.heading3,
                                    )),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                                  :Container();
                            }
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    height: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Text(
                              "20 Ago 2022",
                              style: MyTextStyle.text1,
                            )),
                            InkWell(
                              onTap: () {
                                var bloc = context.read<ChooseDateProviders>();
                                if (bloc.dates.length < 2 &&
                                    !bloc.dates.contains(index)) {
                                  bloc.setDate(val: index);
                                } else if (bloc.dates.contains(index)) {
                                  bloc.removeDate(val: index);
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Builder(builder: (context) {
                                  var bloc =
                                      context.watch<ChooseDateProviders>();
                                  return Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: (bloc.dates.contains(index))
                                                ? MyColors.redColor
                                                : MyColors.blackColor,
                                            width: (bloc.dates.contains(index))
                                                ? 5
                                                : 2)),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(builder: (context) {
                var bloc = context.watch<ChooseDateProviders>();
                bool isEnabled = false;
                if ((bloc.dates.length == 2) || Singleton.isDev) {
                  isEnabled = true;
                }
                return PrimaryButton(
                  title: Constants.btnChooseDatesScreen,
                  backgroundColor: MyColors.blackColor,
                  textColor: Colors.white,
                  borderColor: MyColors.blackColor,
                  enabled: isEnabled,
                  onPressed: () {
                    Navigator.pushNamed(context, MeasurementsComparisonScreen.tag);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
