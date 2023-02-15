import 'package:fit_tech/presentation/screens/dialogue/food_dialogue.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/food_type_screen.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  static const String tag = "food_list_screen";

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen>
    with TickerProviderStateMixin {
  var selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: Column(
          children: [
            SizedBox(
              height: 65.0,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: MyColors.blackColor,
                          size: 24.0,
                        ),
                        onPressed: () {
                          // Navigator.pop(context);
                          Navigator.pushNamed(context, FoodTypeScreen.tag);
                        },
                      ),
                      Expanded(
                          child: TextFormField(
                        maxLines: 1,
                        decoration: const InputDecoration(
                            hintText: "Buscar alimento",
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      )),
                      Opacity(
                        opacity: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline_outlined,
                            color: MyColors.blackColor,
                            size: 24.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const Divider()
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showDialogue(context: context);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: Text(
                                "Alimento 1",
                                style: MyTextStyle.text1,
                              ),
                            ),
                            Divider()
                          ],
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogue({required BuildContext context}) {
    showModalBottomSheet<bool?>(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const FoodDialogue(),
          );
        }).then((val) {
      if ((val is bool) && (val == true)) {
        Navigator.pop(context);
      }
    });
  }
}
