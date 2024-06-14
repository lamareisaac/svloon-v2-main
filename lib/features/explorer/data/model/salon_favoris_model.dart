// To parse this JSON data, do
//
//     final salonFavoris = salonFavorisFromJson(jsonString);

import 'dart:convert';

List<SalonFavoris> salonFavorisFromJson(String str) => List<SalonFavoris>.from(json.decode(str).map((x) => SalonFavoris.fromJson(x)));

String salonFavorisToJson(List<SalonFavoris> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalonFavoris {
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

    SalonFavoris({
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

    factory SalonFavoris.fromJson(Map<String, dynamic> json) => SalonFavoris(
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
    List<dynamic> staff;
    List<dynamic> porfolio;

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
        staff: List<dynamic>.from(json["staff"].map((x) => x)),
        porfolio: List<dynamic>.from(json["porfolio"].map((x) => x)),
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
        "staff": List<dynamic>.from(staff.map((x) => x)),
        "porfolio": List<dynamic>.from(porfolio.map((x) => x)),
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
