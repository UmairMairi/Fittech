import 'package:fit_tech/logic/add_measurements_provider.dart';
import 'package:fit_tech/presentation/screens/dialogue/image_source.dart';
import 'package:fit_tech/presentation/screens/dialogue/test_result_dialogue.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/add_measurements_scren.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/measurement_history_screen.dart';
import 'package:fit_tech/presentation/screens/profile/testResults/choose_dates_screen.dart';
import 'package:fit_tech/presentation/screens/trainingTest/heart_status_screen.dart';
import 'package:fit_tech/presentation/widgets/btn_primary.dart';
import 'package:fit_tech/utils/assets_paths.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeasurementsScreen extends StatefulWidget {
  // final bool isNutritionTest;
  final MeasurementsType type;

  const MeasurementsScreen(
      {super.key,
      // this.isNutritionTest = false,
      this.type = MeasurementsType.addNew});

  static const String tag = "measurements_screen";

  @override
  State<MeasurementsScreen> createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Builder(
          builder: (context) {
            var provider = context.watch<AddMeasurementsProviders>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.type == MeasurementsType.addNew)
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                        child: Text(
                          Constants.measurementsScreenHeading2,
                          style: MyTextStyle.heading2,
                        ),
                      ),
                    if (widget.type == MeasurementsType.addNewFromHistory)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          Constants.measurementsScreenHeading1,
                          style: MyTextStyle.heading3,
                        ),
                      ),
                    SizedBox(
                      height: 250,
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              showDialogueSourceType(
                                  context: context, imageAspect: "0");
                            },
                            child: Builder(builder: (context) {
                              var img = context
                                  .watch<AddMeasurementsProviders>()
                                  .frontImage;
                              return img != null
                                  ? Container(
                                      color: Colors.red,
                                      child: Image.file(
                                        img,
                                        fit: BoxFit.cover,
                                        height: 250,
                                      ),
                                    )
                                  : (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? Container(
                                          color: MyColors.blackColor,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  decoration: const BoxDecoration(
                                                      color: MyColors.redColor,
                                                      shape: BoxShape.circle),
                                                  child: Text(
                                                    "1",
                                                    style: MyTextStyle.paragraph1
                                                        .copyWith(
                                                            color: MyColors
                                                                .whiteColor),
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                const ImageIcon(
                                                  AssetImage(Images
                                                      .iconCameraMeasurementsScreen),
                                                  color: MyColors.redColor,
                                                  size: 30,
                                                ),
                                                Expanded(child: Container()),
                                                Text(
                                                  "Frontal",
                                                  style: MyTextStyle.heading3
                                                      .copyWith(
                                                          color: MyColors.redColor,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(color: MyColors.greyColor);
                            }),
                          )),
                          const SizedBox(
                            width: 1,
                          ),
                          Expanded(child: Builder(builder: (context) {
                            var provider =
                                Provider.of<AddMeasurementsProviders>(context);
                            var isSelected = provider.frontImage != null;
                            return InkWell(
                                onTap: () {
                                  showDialogueSourceType(
                                      context: context, imageAspect: "1");
                                },
                                child: (provider.sideImage != null)
                                    ? Container(
                                        color: Colors.red,
                                        child: Image.file(
                                          provider.sideImage!,
                                          fit: BoxFit.cover,
                                          height: 250,
                                        ),
                                      )
                                    : (widget.type == MeasurementsType.addNew ||
                                            widget.type ==
                                                MeasurementsType.addNewFromHistory)
                                        ? Container(
                                            color: MyColors.blackColor,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 20.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    decoration: BoxDecoration(
                                                        color: isSelected
                                                            ? MyColors.redColor
                                                            : MyColors.greyAccent,
                                                        shape: BoxShape.circle),
                                                    child: Text(
                                                      "2",
                                                      style: MyTextStyle.paragraph1
                                                          .copyWith(
                                                              color: MyColors
                                                                  .whiteColor),
                                                    ),
                                                  ),
                                                  Expanded(child: Container()),
                                                  ImageIcon(
                                                    const AssetImage(Images
                                                        .iconCameraMeasurementsScreen),
                                                    color: isSelected
                                                        ? MyColors.redColor
                                                        : MyColors.greyAccent,
                                                    size: 30,
                                                  ),
                                                  Expanded(child: Container()),
                                                  Text(
                                                    "Perfil",
                                                    style: MyTextStyle.heading3
                                                        .copyWith(
                                                            color: isSelected
                                                                ? MyColors.redColor
                                                                : MyColors
                                                                    .greyAccent,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(color: MyColors.greyColor));
                          })),
                          const SizedBox(
                            width: 1,
                          ),
                          Expanded(child: Builder(builder: (context) {
                            var provider =
                                Provider.of<AddMeasurementsProviders>(context);
                            var isSelected = ((provider.frontImage != null) &&
                                (provider.sideImage != null));
                            return InkWell(
                              onTap: () {
                                showDialogueSourceType(
                                    context: context, imageAspect: "2");
                              },
                              child: (provider.backImage != null)
                                  ? Container(
                                      color: Colors.red,
                                      child: Image.file(
                                        provider.backImage!,
                                        fit: BoxFit.cover,
                                        height: 250,
                                      ),
                                    )
                                  : (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? Container(
                                          color: MyColors.blackColor,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? MyColors.redColor
                                                          : MyColors.greyAccent,
                                                      shape: BoxShape.circle),
                                                  child: Text(
                                                    "3",
                                                    style: MyTextStyle.paragraph1
                                                        .copyWith(
                                                            color: MyColors
                                                                .whiteColor),
                                                  ),
                                                ),
                                                Expanded(child: Container()),
                                                ImageIcon(
                                                  const AssetImage(Images
                                                      .iconCameraMeasurementsScreen),
                                                  color: isSelected
                                                      ? MyColors.redColor
                                                      : MyColors.greyAccent,
                                                  size: 30,
                                                ),
                                                Expanded(child: Container()),
                                                Text(
                                                  "Espalda",
                                                  style: MyTextStyle
                                                      .heading3
                                                      .copyWith(
                                                          color: isSelected
                                                              ? MyColors.redColor
                                                              : MyColors.greyAccent,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(color: MyColors.greyColor),
                            );
                          })),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (widget.type == MeasurementsType.addNew ||
                            widget.type == MeasurementsType.addNewFromHistory)
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              Constants.measurementsScreenHeading3,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: MyColors.greyAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  Constants.measurementsScreenTitle1,
                                  style: MyTextStyle.paragraph1.copyWith(
                                      color: MyColors.blackColor,
                                      fontWeight: FontWeight.bold),
                                )),
                                if (widget.type == MeasurementsType.testResult)
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MeasurementHistoryScreen.tag);
                                    },
                                    child: Text(
                                      "Ver historial",
                                      textAlign: TextAlign.end,
                                      style: MyTextStyle.paragraph1.copyWith(
                                          color: MyColors.redColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                              ],
                            ),
                          ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle2,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type ==
                                          MeasurementsType.addNewFromHistory)
                                  ? provider.weightTest??"+ Agregar"
                                  : "62 kg",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.weightTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(context: context, category: TestResult.weight);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle3,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type ==
                                          MeasurementsType.addNewFromHistory)
                                  ? provider.heightTest??"+ Agregar"
                                  : "180cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.heightTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(context: context, category: TestResult.height);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle4,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type ==
                                          MeasurementsType.addNewFromHistory)
                                  ? provider.minWaistTest??"+ Agregar"
                                  : "60cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.minWaistTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(
                            context: context, category: TestResult.minWaist);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle5,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type ==
                                          MeasurementsType.addNewFromHistory)
                                  ? provider.maxWaistTest??"+ Agregar"
                                  : "60cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.maxWaistTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(
                            context: context, category: TestResult.maxWaist);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle6,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type ==
                                          MeasurementsType.addNewFromHistory)
                                  ? provider.hipTest??"+ Agregar"
                                  : "60cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.hipTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(context: context, category: TestResult.hip);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle7,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type ==
                                          MeasurementsType.addNewFromHistory)
                                  ? provider.neckTest??"+ Agregar"
                                  : "60cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.neckTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(context: context, category: TestResult.neck);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle8,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type ==
                                          MeasurementsType.addNewFromHistory)
                                  ? provider.middleThighTest??"+ Agregar"
                                  : "60cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.middleThighTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(
                            context: context, category: TestResult.middleThigh);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle9,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type == MeasurementsType.addNewFromHistory)
                                  ? provider.armTest??"+ Agregar"
                                  : "60cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.armTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(context: context, category: TestResult.arm);
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              Constants.measurementsScreenTitle10,
                              style: MyTextStyle.paragraph1
                                  .copyWith(color: MyColors.blackColor),
                            )),
                            Text(
                              (widget.type == MeasurementsType.addNew ||
                                      widget.type == MeasurementsType.addNewFromHistory)
                                  ? provider.chestTest??"+ Agregar"
                                  : "60cm",
                              textAlign: TextAlign.end,
                              style: MyTextStyle.paragraph1.copyWith(
                                  color: (widget.type == MeasurementsType.addNew ||
                                          widget.type ==
                                              MeasurementsType.addNewFromHistory)
                                      ? provider.chestTest!=null?MyColors.greyColor:MyColors.redColor
                                      : MyColors.greyColor),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialogue(context: context, category: TestResult.chest);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (widget.type == MeasurementsType.history)
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: PrimaryButton(
                        title: Constants.measurementsScreenLabel2,
                        backgroundColor: MyColors.whiteColor,
                        textColor: MyColors.blackColor,
                        borderColor: MyColors.blackColor,
                        onPressed: () {
                          Navigator.pushNamed(context, ChooseDatesScreen.tag);
                        },
                      )),
                if (widget.type == MeasurementsType.testResult)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            title: Constants.measurementsScreenLabel1,
                            backgroundColor: MyColors.blackColor,
                            textColor: MyColors.whiteColor,
                            borderColor: MyColors.blackColor,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AddMeasurementsScreen.tag,
                                  arguments: MeasurementsType.addNewFromHistory);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: PrimaryButton(
                            title: Constants.measurementsScreenLabel2,
                            backgroundColor: MyColors.whiteColor,
                            textColor: MyColors.blackColor,
                            borderColor: MyColors.blackColor,
                            onPressed: () {
                              Navigator.pushNamed(context, ChooseDatesScreen.tag);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.type == MeasurementsType.addNew)
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: PrimaryButton(
                        title: Constants.measurementsScreenLabel3,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                        borderColor: MyColors.blackColor,
                        onPressed: () {
                          context.read<AddMeasurementsProviders>().setData();
                          if (widget.type == MeasurementsType.addNew) {
                            Navigator.pushNamed(context, HeartStatusScreen.tag,
                                arguments:
                                    (widget.type == MeasurementsType.addNew));
                          }
                        },
                      )),
                if (widget.type == MeasurementsType.addNewFromHistory)
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: PrimaryButton(
                        title: Constants.measurementsScreenLabel3,
                        backgroundColor: MyColors.blackColor,
                        textColor: MyColors.whiteColor,
                        borderColor: MyColors.blackColor,
                        onPressed: () {
                          context.read<AddMeasurementsProviders>().setData();
                          Navigator.pop(context);
                        },
                      )),
                const SizedBox(
                  height: 40,
                )
              ],
            );
          }
        ),
      ),
    );
  }

  showDialogue({required BuildContext context, required TestResult category}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TestResultsDialogue(
            category: category,
            onSetValue: (val) {
              switch(category){
                case TestResult.weight:{
                  context.read<AddMeasurementsProviders>().setWeight(val: val);
                }
                break;
                case TestResult.height:{
                  context.read<AddMeasurementsProviders>().setHeight(val: val);
                }
                break;
                case TestResult.minWaist:{
                  context.read<AddMeasurementsProviders>().setMinWaist(val: val);

                }
                break;
                case TestResult.maxWaist:{
                  context.read<AddMeasurementsProviders>().setMaxWaist(val: val);

                }
                break;
                case TestResult.hip:{
                  context.read<AddMeasurementsProviders>().setHip(val: val);
                }
                break;
                case TestResult.neck:{
                  context.read<AddMeasurementsProviders>().setNeck(val: val);

                }
                break;
                case TestResult.middleThigh:{
                  context.read<AddMeasurementsProviders>().setMiddleThigh(val: val);

                }
                break;
                case TestResult.arm:{
                  context.read<AddMeasurementsProviders>().setArm(val: val);

                }
                break;
                case TestResult.chest:{
                  context.read<AddMeasurementsProviders>().setChest(val: val);
                }
                break;
              }
            },
          ),
        );
      },
    );
  }

  showDialogueSourceType({
    required BuildContext context,
    required String imageAspect,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ImageSource(
            onCamera: () {
              if (imageAspect == "0") {
                context
                    .read<AddMeasurementsProviders>()
                    .getFrontImage(context: context);
              } else if (imageAspect == "1") {
                context
                    .read<AddMeasurementsProviders>()
                    .getSideImage(context: context);
              } else {
                context
                    .read<AddMeasurementsProviders>()
                    .getBackImage(context: context);
              }
              Navigator.pop(context);
            },
            onGallery: () {
              if (imageAspect == "0") {
                context.read<AddMeasurementsProviders>().getFrontImage(
                    context: context, source: SourceType.gallery);
              } else if (imageAspect == "1") {
                context
                    .read<AddMeasurementsProviders>()
                    .getSideImage(context: context, source: SourceType.gallery);
              } else {
                context
                    .read<AddMeasurementsProviders>()
                    .getBackImage(context: context, source: SourceType.gallery);
              }
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

enum TestResult {
  weight,
  height,
  minWaist,
  maxWaist,
  hip,
  neck,
  middleThigh,
  arm,
  chest,
}
