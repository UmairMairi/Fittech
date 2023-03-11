// To parse this JSON data, do
//
//     final nutritionTestModel = nutritionTestModelFromJson(jsonString);

import 'dart:convert';

NutritionTestModel nutritionTestModelFromJson(String str) => NutritionTestModel.fromJson(json.decode(str));

String nutritionTestModelToJson(NutritionTestModel data) => json.encode(data.toJson());

class NutritionTestModel {
    NutritionTestModel({
        required this.height,
        required this.weight,
        required this.foodDontLike,
        required this.minimumWaist,
        required this.maximumWaist,
        required this.hip,
        required this.neck,
        required this.middleThigh,
        required this.arm,
        required this.chest,
        required this.nutritionLine,
        required this.fatPercentage,
    });

    int height;
    int weight;
    List foodDontLike;
    int minimumWaist;
    int maximumWaist;
    int hip;
    int neck;
    int middleThigh;
    int arm;
    int chest;
    String nutritionLine;
    String fatPercentage;

    factory NutritionTestModel.fromJson(Map<String, dynamic> json) => NutritionTestModel(
        height: json["height"],
        weight: json["weight"],
        foodDontLike: json["food_dont_like"] == null ? [] : List<int>.from(json["food_dont_like"].map((x) => x)),
        minimumWaist: json["minimum_waist"],
        maximumWaist: json["maximum_waist"],
        hip: json["hip"],
        neck: json["neck"],
        middleThigh: json["middle_thigh"],
        arm: json["arm"],
        chest: json["chest"],
        nutritionLine: json["nutrition_line"],
        fatPercentage: json["fat_percentage"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "food_dont_like": "food_dont_like" == null ? [] : List<dynamic>.from(foodDontLike.map((x) => x)),
        "minimum_waist": minimumWaist,
        "maximum_waist": maximumWaist,
        "hip": hip,
        "neck": neck,
        "middle_thigh": middleThigh,
        "arm": arm,
        "chest": chest,
        "nutrition_line": nutritionLine,
        "fat_percentage": fatPercentage,
    };
}
