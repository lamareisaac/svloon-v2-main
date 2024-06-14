part of 'reservation_cubit.dart';

abstract class ReservationHistoryState extends Equatable {
  const ReservationHistoryState();

  @override
  List<Object> get props => [];
}

 class ReservationHistoryInitial extends ReservationHistoryState {}
 class ReservationHistoryLoading extends ReservationHistoryState {}
 class ReservationHistorySuccess extends ReservationHistoryState {
  final List<ReservationHistory> reservations;
    ReservationHistorySuccess({ required this.reservations});

  @override
  List<Object> get props => [reservations];
 }
class ReservationHistoryFailure extends ReservationHistoryState {
  final String error;
    ReservationHistoryFailure({ required this.error});

  @override
  List<Object> get props => [error];
}