// To parse this JSON data, do
//
//     final commoditie = commoditieFromJson(jsonString);

import 'dart:convert';

List<Commoditie> commoditieFromJson(String str) => List<Commoditie>.from(json.decode(str).map((x) => Commoditie.fromJson(x)));

String commoditieToJson(List<Commoditie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Commoditie {
    String label;
    String slug;
    String imageUrl;
    DateTime createdAt;
    DateTime updatedAt;

    Commoditie({
        required this.label,
        required this.slug,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Commoditie.fromJson(Map<String, dynamic> json) => Commoditie(
        label: json["label"],
        slug: json["slug"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "slug": slug,
        "imageUrl": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
