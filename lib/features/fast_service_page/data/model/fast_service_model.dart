// To parse this JSON data, do
//
//     final catalogue = catalogueFromJson(jsonString);

import 'dart:convert';

List<Catalogue> catalogueFromJson(String str) => List<Catalogue>.from(json.decode(str).map((x) => Catalogue.fromJson(x)));

String catalogueToJson(List<Catalogue> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catalogue {
    int id;
    String label;
    String slug;
    String imageUrl;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    List<Service> services;

    Catalogue({
        required this.id,
        required this.label,
        required this.slug,
        required this.imageUrl,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.services,
    });

    factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
        id: json["id"],
        label: json["label"],
        slug: json["slug"],
        imageUrl: json["image_url"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "slug": slug,
        "image_url": imageUrl,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Service {
    int id;
    String title;
    String slug;
    String description;
    String price;
    dynamic isPromo;
    String imageUrl;
    DateTime createdAt;
    DateTime updatedAt;
    int serviceTypeId;
    List<Extra> extras;

    Service({
        required this.id,
        required this.title,
        required this.slug,
        required this.description,
        required this.price,
        required this.isPromo,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.serviceTypeId,
        required this.extras,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        price: json["price"],
        isPromo: json["isPromo"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceTypeId: json["service_type_id"],
        extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "price": price,
        "isPromo": isPromo,
        "imageUrl": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service_type_id": serviceTypeId,
        "extras": List<dynamic>.from(extras.map((x) => x.toJson())),
    };
}

class Extra {
    int id;
    String name;
    String prix;
    String extTime;
    DateTime createdAt;
    DateTime updatedAt;

    Extra({
        required this.id,
        required this.name,
        required this.prix,
        required this.extTime,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        id: json["id"],
        name: json["name"],
        prix: json["prix"],
        extTime: json["ext_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "prix": prix,
        "ext_time": extTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
