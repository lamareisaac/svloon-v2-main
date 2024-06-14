part of 'get_service_cubit.dart';

abstract class GetServiceState extends Equatable {
  const GetServiceState();

  @override
  List<Object> get props => [];
}
class GetServiceInitial extends GetServiceState {}
class GetServiceLoading extends GetServiceState {}
class GetServiceSuccess extends GetServiceState {
  final List<Catalogue> services;
    GetServiceSuccess({ required this.services});

  @override
  List<Object> get props => [services];
}
class GetServiceFailure extends GetServiceState {
  final String error;
    GetServiceFailure({ required this.error});

  @override
  List<Object> get props => [error];
}
