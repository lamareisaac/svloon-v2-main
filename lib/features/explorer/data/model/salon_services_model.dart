// To parse this JSON data, do
//
//     final salonServiceModel = salonServiceModelFromJson(jsonString);

import 'dart:convert';

List<SalonServiceModel> salonServiceModelFromJson(String str) => List<SalonServiceModel>.from(json.decode(str).map((x) => SalonServiceModel.fromJson(x)));

String salonServiceModelToJson(List<SalonServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalonServiceModel {
    int id;
    String name;
    String price;
    String time;
    int salonId;
    int serviceTypeId;
    int servicePlaceTypeId;
    DateTime createdAt;
    DateTime updatedAt;
    String imageUrl;

    SalonServiceModel({
        required this.id,
        required this.name,
        required this.price,
        required this.time,
        required this.salonId,
        required this.serviceTypeId,
        required this.servicePlaceTypeId,
        required this.createdAt,
        required this.updatedAt,
        required this.imageUrl,
    });

    factory SalonServiceModel.fromJson(Map<String, dynamic> json) => SalonServiceModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        time: json["time"],
        salonId: json["salon_id"],
        serviceTypeId: json["service_type_id"],
        servicePlaceTypeId: json["service_place_type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "time": time,
        "salon_id": salonId,
        "service_type_id": serviceTypeId,
        "service_place_type_id": servicePlaceTypeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "imageUrl": imageUrl,
    };
}
