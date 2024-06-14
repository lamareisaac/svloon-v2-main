// To parse this JSON data, do
//
//     final salonModel = salonModelFromJson(jsonString);

import 'dart:convert';

List<SalonModel> salonModelFromJson(String str) => List<SalonModel>.from(json.decode(str).map((x) => SalonModel.fromJson(x)));

String salonModelToJson(List<SalonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalonModel {
    int id;
    String email;
    String firstname;
    String lastname;
    String name;
    String dialCode;
    String phoneNumber;
    String? profession;
    String photoUrl;
    dynamic birthday;
    Type type;
    Salon salon;

    SalonModel({
        required this.id,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.name,
        required this.dialCode,
        required this.phoneNumber,
        required this.profession,
        required this.photoUrl,
        required this.birthday,
        required this.type,
        required this.salon,
    });

    factory SalonModel.fromJson(Map<String, dynamic> json) => SalonModel(
        id: json["id"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        name: json["name"],
        dialCode: json["dial_code"],
        phoneNumber: json["phone_number"],
        profession: json["profession"],
        photoUrl: json["photo_url"],
        birthday: json["birthday"],
        type: Type.fromJson(json["type"]),
        salon: Salon.fromJson(json["salon"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "name": name,
        "dial_code": dialCode,
        "phone_number": phoneNumber,
        "profession": profession,
        "photo_url": photoUrl,
        "birthday": birthday,
        "type": type.toJson(),
        "salon": salon.toJson(),
    };
}

class Salon {
    int id;
    String name;
    String email;
    String dialCode;
    String phoneNumber;
    String? coverPicture;
    String city;
    Adresse? adresse;
    List<String> pictures;
    List<dynamic> availabilities;
    List<dynamic> commodities;
    List<Staff> staff;
    List<dynamic> porfolio;
    List<Service> services;

    Salon({
        required this.id,
        required this.name,
        required this.email,
        required this.dialCode,
        required this.phoneNumber,
        required this.coverPicture,
        required this.city,
        required this.adresse,
        required this.pictures,
        required this.availabilities,
        required this.commodities,
        required this.staff,
        required this.porfolio,
        required this.services,
    });

    factory Salon.fromJson(Map<String, dynamic> json) => Salon(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        dialCode: json["dialCode"],
        phoneNumber: json["phoneNumber"],
        coverPicture: json["cover_picture"],
        city: json["city"],
        adresse: json["adresse"] == null ? null : Adresse.fromJson(json["adresse"]),
        pictures: List<String>.from(json["pictures"].map((x) => x)),
        availabilities: List<dynamic>.from(json["availabilities"].map((x) => x)),
        commodities: List<dynamic>.from(json["commodities"].map((x) => x)),
        staff: List<Staff>.from(json["staff"].map((x) => Staff.fromJson(x))),
        porfolio: List<dynamic>.from(json["porfolio"].map((x) => x)),
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "dialCode": dialCode,
        "phoneNumber": phoneNumber,
        "cover_picture": coverPicture,
        "city": city,
        "adresse": adresse?.toJson(),
        "pictures": List<dynamic>.from(pictures.map((x) => x)),
        "availabilities": List<dynamic>.from(availabilities.map((x) => x)),
        "commodities": List<dynamic>.from(commodities.map((x) => x)),
        "staff": List<dynamic>.from(staff.map((x) => x.toJson())),
        "porfolio": List<dynamic>.from(porfolio.map((x) => x)),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Adresse {
    String lat;
    String lon;
    String addressName;
    String batimentName;
    String numberLocal;
    String indications;
    String bail;

    Adresse({
        required this.lat,
        required this.lon,
        required this.addressName,
        required this.batimentName,
        required this.numberLocal,
        required this.indications,
        required this.bail,
    });

    factory Adresse.fromJson(Map<String, dynamic> json) => Adresse(
        lat: json["lat"],
        lon: json["lon"],
        addressName: json["address_name"],
        batimentName: json["batiment_name"],
        numberLocal: json["number_local"],
        indications: json["indications"],
        bail: json["bail"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "address_name": addressName,
        "batiment_name": batimentName,
        "number_local": numberLocal,
        "indications": indications,
        "bail": bail,
    };
}

class Service {
    String name;
    dynamic description;
    String imageUrl;
    String price;
    String time;
    int salonId;
    int serviceTypeId;
    int servicePlaceTypeId;
    List<Extra> extra;

    Service({
        required this.name,
        required this.description,
        required this.imageUrl,
        required this.price,
        required this.time,
        required this.salonId,
        required this.serviceTypeId,
        required this.servicePlaceTypeId,
        required this.extra,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        price: json["price"],
        time: json["time"],
        salonId: json["salon_id"],
        serviceTypeId: json["service_type_id"],
        servicePlaceTypeId: json["service_place_type_id"],
        extra: List<Extra>.from(json["extra"].map((x) => Extra.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "price": price,
        "time": time,
        "salon_id": salonId,
        "service_type_id": serviceTypeId,
        "service_place_type_id": servicePlaceTypeId,
        "extra": List<dynamic>.from(extra.map((x) => x.toJson())),
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

class Staff {
    String fullname;
    String imageUrl;
    String fonction;
    String phone;
    int salonId;
    int artistId;

    Staff({
        required this.fullname,
        required this.imageUrl,
        required this.fonction,
        required this.phone,
        required this.salonId,
        required this.artistId,
    });

    factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        fullname: json["fullname"],
        imageUrl: json["imageUrl"],
        fonction: json["fonction"],
        phone: json["phone"],
        salonId: json["salon_id"],
        artistId: json["artist_id"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "imageUrl": imageUrl,
        "fonction": fonction,
        "phone": phone,
        "salon_id": salonId,
        "artist_id": artistId,
    };
}

class Type {
    String label;
    String slug;

    Type({
        required this.label,
        required this.slug,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        label: json["label"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "slug": slug,
    };
}
