part of 'salon_cubit.dart';

abstract class SalonState extends Equatable {
  const SalonState();

  @override
  List<Object> get props => [];
}

 class SalonInitial extends SalonState {}
class GetSalonLoading extends SalonState {}
class GetSalonSuccess extends SalonState {
  final List<SalonModel> salon;
    GetSalonSuccess({ required this.salon});

  @override
  List<Object> get props => [salon];
}
class GetSalonFailure extends SalonState {
  final String error;
    GetSalonFailure({ required this.error});

  @override
  List<Object> get props => [error];
}
