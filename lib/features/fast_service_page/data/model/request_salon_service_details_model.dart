// To parse this JSON data, do
//
//     final requestSalonServiceDetailsModel = requestSalonServiceDetailsModelFromJson(jsonString);

import 'dart:convert';

RequestSalonServiceDetailsModel requestSalonServiceDetailsModelFromJson(String str) => RequestSalonServiceDetailsModel.fromJson(json.decode(str));

String requestSalonServiceDetailsModelToJson(RequestSalonServiceDetailsModel data) => json.encode(data.toJson());

class RequestSalonServiceDetailsModel {
    Appointement appointement;
    Order order;

    RequestSalonServiceDetailsModel({
        required this.appointement,
        required this.order,
    });

    factory RequestSalonServiceDetailsModel.fromJson(Map<String, dynamic> json) => RequestSalonServiceDetailsModel(
        appointement: Appointement.fromJson(json["appointement"]),
        order: Order.fromJson(json["order"]),
    );

    Map<String, dynamic> toJson() => {
        "appointement": appointement.toJson(),
        "order": order.toJson(),
    };
}

class Appointement {
    int creatorId;
    int userId;
    int artistId;
    AppointmentStatus appointmentStatus;
    DateTime date;
    DateTime hour;
    dynamic dateTime;
    String reference;
    bool isConfirmed;
    bool isReport;
    bool isCancel;
    List<Service> services;
    dynamic reportDate;
    Order order;

    Appointement({
        required this.creatorId,
        required this.userId,
        required this.artistId,
        required this.appointmentStatus,
        required this.date,
        required this.hour,
        required this.dateTime,
        required this.reference,
        required this.isConfirmed,
        required this.isReport,
        required this.isCancel,
        required this.services,
        required this.reportDate,
        required this.order,
    });

    factory Appointement.fromJson(Map<String, dynamic> json) => Appointement(
        creatorId: json["creator_id"],
        userId: json["user_id"],
        artistId: json["artist_id"],
        appointmentStatus: AppointmentStatus.fromJson(json["appointment_status"]),
        date: DateTime.parse(json["date"]),
        hour: DateTime.parse(json["hour"]),
        dateTime: json["date_time"],
        reference: json["reference"],
        isConfirmed: json["is_confirmed"],
        isReport: json["is_report"],
        isCancel: json["is_cancel"],
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        reportDate: json["report_date"],
        order: Order.fromJson(json["order"]),
    );

    Map<String, dynamic> toJson() => {
        "creator_id": creatorId,
        "user_id": userId,
        "artist_id": artistId,
        "appointment_status": appointmentStatus.toJson(),
        "date": date.toIso8601String(),
        "hour": hour.toIso8601String(),
        "date_time": dateTime,
        "reference": reference,
        "is_confirmed": isConfirmed,
        "is_report": isReport,
        "is_cancel": isCancel,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "report_date": reportDate,
        "order": order.toJson(),
    };
}

class AppointmentStatus {
    int id;
    String name;
    String description;
    String color;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    AppointmentStatus({
        required this.id,
        required this.name,
        required this.description,
        required this.color,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AppointmentStatus.fromJson(Map<String, dynamic> json) => AppointmentStatus(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        color: json["color"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "color": color,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Order {
    String orderStatus;
    dynamic details;
    dynamic instructions;
    String totalPrice;
    DateTime date;

    Order({
        required this.orderStatus,
        required this.details,
        required this.instructions,
        required this.totalPrice,
        required this.date,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderStatus: json["order_status"],
        details: json["details"],
        instructions: json["instructions"],
        totalPrice: json["total_price"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "order_status": orderStatus,
        "details": details,
        "instructions": instructions,
        "total_price": totalPrice,
        "date": date.toIso8601String(),
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
