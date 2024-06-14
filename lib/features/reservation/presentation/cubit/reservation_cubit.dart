import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svloon2/features/Location/data/model/location_saved_model.dart';
import 'package:svloon2/features/Location/domain/usercases/get_locations_saved_usecase.dart';
import 'package:svloon2/features/reservation/data/model/reservation_history_model.dart';
import 'package:svloon2/features/reservation/domain/usercases/get_reservation_usecase.dart';


part 'reservation_state.dart';

class ReservationHistoryCubit extends Cubit<ReservationHistoryState> {
     final GetReservationHistoryCase getReservationHistoryCase;

  ReservationHistoryCubit({required this.getReservationHistoryCase}) : super(ReservationHistoryInitial());


   Future<void> getReservationHistory() async{
    emit(ReservationHistoryLoading());
    try {
     List<ReservationHistory> results = await getReservationHistoryCase.call();
      emit(ReservationHistorySuccess(reservations: results));
      
    } on SocketException catch (_){
      emit(ReservationHistoryFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(ReservationHistoryFailure(error: _.toString()));
    }
  }
}
