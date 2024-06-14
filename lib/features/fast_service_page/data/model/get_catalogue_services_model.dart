// To parse this JSON data, do
//
//     final getCatalogueService = getCatalogueServiceFromJson(jsonString);

import 'dart:convert';

GetCatalogueService getCatalogueServiceFromJson(String str) => GetCatalogueService.fromJson(json.decode(str));

String getCatalogueServiceToJson(GetCatalogueService data) => json.encode(data.toJson());

class GetCatalogueService {
    int id;
    String title;
    String description;
    String price;
    bool isPromo;
    String imageUrl;
    dynamic createdAt;
    dynamic updatedAt;
    int serviceTypeId;
    int salonId;
    String slug;

    GetCatalogueService({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.isPromo,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.serviceTypeId,
        required this.salonId,
        required this.slug,
    });

    factory GetCatalogueService.fromJson(Map<String, dynamic> json) => GetCatalogueService(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        isPromo: json["isPromo"],
        imageUrl: json["imageUrl"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        serviceTypeId: json["service_type_id"],
        salonId: json["salon_id"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "isPromo": isPromo,
        "imageUrl": imageUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "service_type_id": serviceTypeId,
        "salon_id": salonId,
        "slug": slug,
    };
}
