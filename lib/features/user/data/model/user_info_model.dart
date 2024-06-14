// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int id;
    String email;
    String firstname;
    String lastname;
    String name;
    String dialCode;
    String phoneNumber;
    String profession;
    String photoUrl;
    dynamic birthday;
    Type type;
    dynamic salon;

    User({
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

    factory User.fromJson(Map<String, dynamic> json) => User(
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
        salon: json["salon"],
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
        "salon": salon,
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
