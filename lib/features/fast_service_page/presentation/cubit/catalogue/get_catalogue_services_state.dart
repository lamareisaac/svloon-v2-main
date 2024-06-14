part of 'get_catalogue_services_cubit.dart';

abstract class GetCatalogueServicesState extends Equatable {
  const GetCatalogueServicesState();

  @override
  List<Object> get props => [];
}

 class GetCatalogueServicesInitial extends GetCatalogueServicesState {}
 class GetCatalogueServicesLoading extends GetCatalogueServicesState {}
 class GetCatalogueServicesSucess extends GetCatalogueServicesState {
  final GetCatalogueService service;
    GetCatalogueServicesSucess({ required this.service});

  @override
  List<Object> get props => [service];
 }
 class GetCatalogueServicesError extends GetCatalogueServicesState {
  final String error;
    GetCatalogueServicesError({ required this.error});

  @override
  List<Object> get props => [error];
 }