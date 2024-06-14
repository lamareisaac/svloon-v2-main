

import 'package:svloon2/features/reservation/data/model/reservation_history_model.dart';

import '../repository/reservation_repository.dart';

class GetReservationHistoryCase{
  final ReservationRepository repository;

  GetReservationHistoryCase({required this.repository});

  Future<List<ReservationHistory>> call(){
    return repository.getReservationHistory();
  }
}