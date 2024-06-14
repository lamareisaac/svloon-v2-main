


import 'package:svloon2/features/reservation/data/model/reservation_history_model.dart';
import 'package:svloon2/features/reservation/data/remote_data_source/reservation_remote_data_source.dart';

import '../domain/repository/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {

  final ReservationRemoteDataSource remoteDataSource;

  ReservationRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<ReservationHistory>> getReservationHistory() async => remoteDataSource.getReservationHistory();



  
}