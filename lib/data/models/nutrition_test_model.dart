class NutritionTestModel {
  int? height;
  int? weight;
  int? foodDontLike;
  int? minimumWaist;
  int? maximumWaist;
  int? hip;
  int? neck;
  int? middleThigh;
  int? arm;
  int? chest;
  String? nutritionLine;
  String? fatPercentage;

  NutritionTestModel(
      {this.height,
      this.weight,
      this.foodDontLike,
      this.minimumWaist,
      this.maximumWaist,
      this.hip,
      this.neck,
      this.middleThigh,
      this.arm,
      this.chest,
      this.nutritionLine,
      this.fatPercentage});

  NutritionTestModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    foodDontLike = json['food_dont_like'];
    minimumWaist = json['minimum_waist'];
    maximumWaist = json['maximum_waist'];
    hip = json['hip'];
    neck = json['neck'];
    middleThigh = json['middle_thigh'];
    arm = json['arm'];
    chest = json['chest'];
    nutritionLine = json['nutrition_line'];
    fatPercentage = json['fat_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['food_dont_like'] = this.foodDontLike;
    data['minimum_waist'] = this.minimumWaist;
    data['maximum_waist'] = this.maximumWaist;
    data['hip'] = this.hip;
    data['neck'] = this.neck;
    data['middle_thigh'] = this.middleThigh;
    data['arm'] = this.arm;
    data['chest'] = this.chest;
    data['nutrition_line'] = this.nutritionLine;
    data['fat_percentage'] = this.fatPercentage;
    return data;
  }
}
