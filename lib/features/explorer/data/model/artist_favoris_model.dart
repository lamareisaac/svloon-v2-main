// To parse this JSON data, do
//
//     final artistFavoris = artistFavorisFromJson(jsonString);

import 'dart:convert';

List<ArtistFavoris> artistFavorisFromJson(String str) => List<ArtistFavoris>.from(json.decode(str).map((x) => ArtistFavoris.fromJson(x)));

String artistFavorisToJson(List<ArtistFavoris> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistFavoris {
    String email;
    String firstname;
    String lastname;
    String name;
    String dialCode;
    String phoneNumber;
    String profession;
    String photoUrl;
    dynamic birthday;
    String type;
    Artist artist;
    String piece;
    String cerificatPro;
    dynamic bankInfo;

    ArtistFavoris({
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
        required this.artist,
        required this.piece,
        required this.cerificatPro,
        required this.bankInfo,
    });

    factory ArtistFavoris.fromJson(Map<String, dynamic> json) => ArtistFavoris(
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        name: json["name"],
        dialCode: json["dial_code"],
        phoneNumber: json["phone_number"],
        profession: json["profession"],
        photoUrl: json["photo_url"],
        birthday: json["birthday"],
        type: json["type"],
        artist: Artist.fromJson(json["artist"]),
        piece: json["piece"],
        cerificatPro: json["cerificat_pro"],
        bankInfo: json["bank_info"],
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
        "type": type,
        "artist": artist.toJson(),
        "piece": piece,
        "cerificat_pro": cerificatPro,
        "bank_info": bankInfo,
    };
}

class Artist {
    int id;
    String categoryPro;
    String fonction;
    List<dynamic> images;
    List<dynamic> portfolio;
    List<dynamic> adresses;

    Artist({
        required this.id,
        required this.categoryPro,
        required this.fonction,
        required this.images,
        required this.portfolio,
        required this.adresses,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        categoryPro: json["category_pro"],
        fonction: json["fonction"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        portfolio: List<dynamic>.from(json["portfolio"].map((x) => x)),
        adresses: List<dynamic>.from(json["adresses"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_pro": categoryPro,
        "fonction": fonction,
        "images": List<dynamic>.from(images.map((x) => x)),
        "portfolio": List<dynamic>.from(portfolio.map((x) => x)),
        "adresses": List<dynamic>.from(adresses.map((x) => x)),
    };
}
