// To parse this JSON data, do
//
//     final chooseFoodModel = chooseFoodModelFromJson(jsonString);

import 'dart:convert';

ChooseFoodModel chooseFoodModelFromJson(String str) => ChooseFoodModel.fromJson(json.decode(str));

String chooseFoodModelToJson(ChooseFoodModel data) => json.encode(data.toJson());

class ChooseFoodModel {
    ChooseFoodModel({
        required this.success,
        required this.statusCode,
        required this.message,
        required this.data,
    });

    bool success;
    int statusCode;
    String message;
    List<Datum> data;

    factory ChooseFoodModel.fromJson(Map<String, dynamic> json) => ChooseFoodModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.protien,
        required this.carbs,
        required this.calorie,
        required this.fat,
        this.type,
        this.portion,
        this.quantity = 1
    });

    int id;
    String name;
    int protien;
    int carbs;
    int calorie;
    int fat;
    String? type;
    dynamic portion;
    dynamic quantity;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        protien: json["protien"],
        carbs: json["carbs"],
        calorie: json["calorie"],
        fat: json["fat"],
        type: json["type"],
        portion: json["portion"],
        quantity: json["quantity"] ?? 1
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "protien": protien,
        "carbs": carbs,
        "calorie": calorie,
        "fat": fat,
        "type": type,
        "portion": portion,
        "quantity":quantity ?? 1
    };
}
