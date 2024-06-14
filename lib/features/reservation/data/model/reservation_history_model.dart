// To parse this JSON data, do
//
//     final reservationHistory = reservationHistoryFromJson(jsonString);

import 'dart:convert';

List<ReservationHistory> reservationHistoryFromJson(String str) => List<ReservationHistory>.from(json.decode(str).map((x) => ReservationHistory.fromJson(x)));

String reservationHistoryToJson(List<ReservationHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservationHistory {
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
    List<dynamic> services;
    dynamic reportDate;
    dynamic order;

    ReservationHistory({
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

    factory ReservationHistory.fromJson(Map<String, dynamic> json) => ReservationHistory(
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
        services: List<dynamic>.from(json["services"].map((x) => x)),
        reportDate: json["report_date"],
        order: json["order"],
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
        "services": List<dynamic>.from(services.map((x) => x)),
        "report_date": reportDate,
        "order": order,
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
