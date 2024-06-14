// To parse this JSON data, do
//
//     final singleSalonModel = singleSalonModelFromJson(jsonString);

import 'dart:convert';

SingleSalonModel singleSalonModelFromJson(String str) => SingleSalonModel.fromJson(json.decode(str));

String singleSalonModelToJson(SingleSalonModel data) => json.encode(data.toJson());

class SingleSalonModel {
    String email;
    String firstname;
    String lastname;
    String name;
    String dialCode;
    String phoneNumber;
    dynamic profession;
    String photoUrl;
    dynamic birthday;
    Type type;
    Salon salon;

    SingleSalonModel({
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

    factory SingleSalonModel.fromJson(Map<String, dynamic> json) => SingleSalonModel(
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
    String coverPicture;
    String city;
    Adresse adresse;
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
        adresse: Adresse.fromJson(json["adresse"]),
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
        "adresse": adresse.toJson(),
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

    Service({
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

    factory Service.fromJson(Map<String, dynamic> json) => Service(
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

class Staff {
    String fullname;
    String imageUrl;
    String fonction;
    String phone;

    Staff({
        required this.fullname,
        required this.imageUrl,
        required this.fonction,
        required this.phone,
    });

    factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        fullname: json["fullname"],
        imageUrl: json["imageUrl"],
        fonction: json["fonction"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "imageUrl": imageUrl,
        "fonction": fonction,
        "phone": phone,
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
