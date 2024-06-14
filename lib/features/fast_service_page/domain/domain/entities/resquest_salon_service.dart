class ResquestSalonService {
    int userId;
    int artistId;
    int salonId;
    String date;
    String hour;
    String details;
    String instructions;
    int salonServiceId;
    int serviceId;
    String dateTime;
    bool isConfirmed;
    bool isReport;
    bool isCancel;
    String reportDate;

    ResquestSalonService({
        required this.userId,
        required this.artistId,
        required this.salonId,
        required this.date,
        required this.hour,
        required this.details,
        required this.instructions,
        required this.salonServiceId,
        required this.serviceId,
        required this.dateTime,
        required this.isConfirmed,
        required this.isReport,
        required this.isCancel,
        required this.reportDate,
    });
}