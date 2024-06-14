part of 'get_single_salon_cubit.dart';

abstract class GetSingleSalonState extends Equatable {
  const GetSingleSalonState();

  @override
  List<Object> get props => [];
}
class GetSingleSalonInitial extends GetSingleSalonState {}
class GetSingleSalonLoading extends GetSingleSalonState {}
class GetSingleSalonSuccess extends GetSingleSalonState {
  final SingleSalonModel salon;
    GetSingleSalonSuccess({ required this.salon});

  @override
  List<Object> get props => [salon];
}
class GetSingleSalonFailure extends GetSingleSalonState {
  final String error;
    GetSingleSalonFailure({ required this.error});

  @override
  List<Object> get props => [error];
}
