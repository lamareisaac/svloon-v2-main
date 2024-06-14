part of 'request_salon_service_cubit.dart';

abstract class RequestSalonServiceCubitState extends Equatable {
  const RequestSalonServiceCubitState();

  @override
  List<Object> get props => [];
}

 class RequestCubitInitial extends RequestSalonServiceCubitState {}
 class RequestCubitSuccess extends RequestSalonServiceCubitState {
  final RequestSalonServiceDetailsModel data;
    RequestCubitSuccess({ required this.data});

  @override
  List<Object> get props => [data];
 }
 class RequestCubitLoading extends RequestSalonServiceCubitState {}
 class RequestCubitError extends RequestSalonServiceCubitState {
  final String error;
    RequestCubitError({ required this.error});

  @override
  List<Object> get props => [error];
 }
