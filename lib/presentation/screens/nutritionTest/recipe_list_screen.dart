import 'dart:developer';

import 'package:fit_tech/presentation/screens/nutritionTest/create_recipe_screen.dart';
import 'package:fit_tech/presentation/screens/nutritionTest/recipe_details_screen.dart';
import 'package:fit_tech/presentation/widgets/shimmer.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/recipe/recipe_list_model.dart';
import '../../../logic/recipe/recipe_provider.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  static const String tag = "recipe_list_screen";

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen>
    with TickerProviderStateMixin {
  var selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  getRecipe() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var provider = context.read<RecipeProvider>();
      provider.getRecipe(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      Constants.titleRecipeListScreen,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.heading3,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: MyColors.blackColor,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, CreateRecipeScreen.tag);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Builder(builder: (context) {
                var provider = context.watch<RecipeProvider>();
                if (provider.isLoading || provider.getRecipeListModel == null) {
                  return ShimmerRecipeList(size: size);
                }
                return provider.getRecipeListModel!.data!.isEmpty
                    ? const Center(
                        child: Text(
                        Constants.noRecipeFoundTitle,
                        style: MyTextStyle.heading3,
                      ))
                    : ListView.builder(
                        itemCount: provider.getRecipeListModel!.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          Data data = provider.getRecipeListModel!.data![index];
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data.name}",
                                      style: MyTextStyle.medium.copyWith(
                                          color: Colors.black,
                                          fontSize: 18,
                                          height: 1.5),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${data.foodRecipie!.length} ingredients",
                                            style: MyTextStyle.inputTitle),
                                        Expanded(child: Container()),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RecipeDetailsScreen.tag);
                                          },
                                          child: Text(
                                            "Ver receta",
                                            style: MyTextStyle.paragraph1
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.redColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                              "${data.totalCalorie} kcal",
                                              style: MyTextStyle.paragraph1),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "P. ${data.totalProtien}g",
                                              style: MyTextStyle.paragraph1),
                                        ),
                                        Expanded(
                                          child: Text("C. ${data.totalCarbs}g",
                                              style: MyTextStyle.paragraph1),
                                        ),
                                        Expanded(
                                          child: Text("G. ${data.totalFats}g",
                                              style: MyTextStyle.paragraph1),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10.0,
                              )
                            ],
                          );
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


class ShimmerRecipeList extends StatelessWidget {
  final size;
  const ShimmerRecipeList({super.key,this.size});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
                    baseColor: MyColors.shimmerBaseColor2,
                    highlightColor: MyColors.shimmerHighlightColor,
                    child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(width: size.width / 2,height: 20,color: MyColors.redColor,),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                                                               Container(width: size.width / 4,height: 20,color: MyColors.redColor,),

                                          Expanded(child: Container()),                                         
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                                                           Container(width: size.width,height: 20,color: MyColors.redColor,),

                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 10.0,
                                )
                              ],
                            );
                          },
                        ),
                  );
             
  }
}