import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class CardioEquipmentsScreen extends StatefulWidget {
  const CardioEquipmentsScreen({super.key});

  static const String tag = "cardio_equipments_screen";

  @override
  State<CardioEquipmentsScreen> createState() => _CardioEquipmentsScreenState();
}

class _CardioEquipmentsScreenState extends State<CardioEquipmentsScreen> {
  var list = [
    "Banda",
    "Bike",
    "Escalas",
    "Remo",
    "Eliptica",
    "Recumbent",
  ];

  @override
  void initState() {
    super.initState();
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
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              Constants.cardioEquipmentScreenTitle,
                              style: MyTextStyle.heading1,
                            ),
                            const Text(
                              Constants.cardioEquipmentScreenInfo,
                              style: MyTextStyle.paragraph1,
                            ),
                            ListView.builder(
                                itemCount: list.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: MyColors.greyMediumColor,
                                            size: 18,
                                          ),
                                          title: Text(
                                            list[index],
                                            style: MyTextStyle.heading3.copyWith(fontWeight: FontWeight.w600),
                                          ),
                                          minLeadingWidth: 0.0,
                                          onTap: () {},
                                          tileColor: MyColors.extraLightGreyColor,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
