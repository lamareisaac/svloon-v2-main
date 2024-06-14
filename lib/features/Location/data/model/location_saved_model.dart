// To parse this JSON data, do
//
//     final userLocationSaved = userLocationSavedFromJson(jsonString);

import 'dart:convert';

List<UserLocationSaved> userLocationSavedFromJson(String str) => List<UserLocationSaved>.from(json.decode(str).map((x) => UserLocationSaved.fromJson(x)));

String userLocationSavedToJson(List<UserLocationSaved> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLocationSaved {
    int id;
    String lat;
    String lon;
    String addressName;
    DateTime createdAt;
    DateTime updatedAt;
    int userId;
    dynamic isActive;

    UserLocationSaved({
        required this.id,
        required this.lat,
        required this.lon,
        required this.addressName,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.isActive,
    });

    factory UserLocationSaved.fromJson(Map<String, dynamic> json) => UserLocationSaved(
        id: json["id"],
        lat: json["lat"],
        lon: json["lon"],
        addressName: json["address_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lon": lon,
        "address_name": addressName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "is_active": isActive,
    };
}
