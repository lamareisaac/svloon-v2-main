

import 'package:svloon2/features/reservation/data/model/reservation_history_model.dart';



abstract class ReservationRepository {
   Future<List<ReservationHistory>> getReservationHistory();
  


}