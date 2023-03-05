class RecipeListModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Data>? data;

  RecipeListModel({this.success, this.statusCode, this.message, this.data});

  RecipeListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? recipieType;
  int? userprofile;
  List<FoodRecipie>? foodRecipie;
  int? totalCalorie;
  int? totalProtien;
  int? totalCarbs;
  int? totalFats;

  Data(
      {this.name,
      this.recipieType,
      this.userprofile,
      this.foodRecipie,
      this.totalCalorie,
      this.totalProtien,
      this.totalCarbs,
      this.totalFats});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    recipieType = json['recipie_type'];
    userprofile = json['userprofile'];
    if (json['food_recipie'] != null) {
      foodRecipie = <FoodRecipie>[];
      json['food_recipie'].forEach((v) {
        foodRecipie!.add(new FoodRecipie.fromJson(v));
      });
    }
    totalCalorie = json['total_calorie'];
    totalProtien = json['total_protien'];
    totalCarbs = json['total_carbs'];
    totalFats = json['total_fats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['recipie_type'] = this.recipieType;
    data['userprofile'] = this.userprofile;
    if (this.foodRecipie != null) {
      data['food_recipie'] = this.foodRecipie!.map((v) => v.toJson()).toList();
    }
    data['total_calorie'] = this.totalCalorie;
    data['total_protien'] = this.totalProtien;
    data['total_carbs'] = this.totalCarbs;
    data['total_fats'] = this.totalFats;
    return data;
  }
}

class FoodRecipie {
  int? id;
  Food? food;
  int? quantity;

  FoodRecipie({this.id, this.food, this.quantity});

  FoodRecipie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    food = json['food'] != null ? new Food.fromJson(json['food']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.food != null) {
      data['food'] = this.food!.toJson();
    }
    data['quantity'] = this.quantity;
    return data;
  }
}

class Food {
  int? id;
  String? name;
  int? protien;
  int? carbs;
  int? calorie;
  int? fat;
  String? createdAt;
  String? updatedAt;

  Food(
      {this.id,
      this.name,
      this.protien,
      this.carbs,
      this.calorie,
      this.fat,
      this.createdAt,
      this.updatedAt});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    protien = json['protien'];
    carbs = json['carbs'];
    calorie = json['calorie'];
    fat = json['fat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['protien'] = this.protien;
    data['carbs'] = this.carbs;
    data['calorie'] = this.calorie;
    data['fat'] = this.fat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
