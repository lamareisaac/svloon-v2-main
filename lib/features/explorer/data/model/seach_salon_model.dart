// To parse this JSON data, do
//
//     final searchSalonModel = searchSalonModelFromJson(jsonString);

import 'dart:convert';

List<SearchSalonModel> searchSalonModelFromJson(String str) => List<SearchSalonModel>.from(json.decode(str).map((x) => SearchSalonModel.fromJson(x)));

String searchSalonModelToJson(List<SearchSalonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchSalonModel {
    int id;
    String name;
    String email;
    dynamic dialCode;
    dynamic phoneNumber;
    dynamic coverPicture;
    dynamic city;
    List<dynamic> pictures;
    dynamic availabilities;
    dynamic commodities;
    dynamic staff;
    dynamic porfolio;
    List<dynamic> services;

    SearchSalonModel({
        required this.id,
        required this.name,
        required this.email,
        required this.dialCode,
        required this.phoneNumber,
        required this.coverPicture,
        required this.city,
        required this.pictures,
        required this.availabilities,
        required this.commodities,
        required this.staff,
        required this.porfolio,
        required this.services,
    });

    factory SearchSalonModel.fromJson(Map<String, dynamic> json) => SearchSalonModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        dialCode: json["dialCode"],
        phoneNumber: json["phoneNumber"],
        coverPicture: json["cover_picture"],
        city: json["city"],
        pictures: List<dynamic>.from(json["pictures"].map((x) => x)),
        availabilities: json["availabilities"],
        commodities: json["commodities"],
        staff: json["staff"],
        porfolio: json["porfolio"],
        services: List<dynamic>.from(json["services"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "dialCode": dialCode,
        "phoneNumber": phoneNumber,
        "cover_picture": coverPicture,
        "city": city,
        "pictures": List<dynamic>.from(pictures.map((x) => x)),
        "availabilities": availabilities,
        "commodities": commodities,
        "staff": staff,
        "porfolio": porfolio,
        "services": List<dynamic>.from(services.map((x) => x)),
    };
}
