

import '../data/model/fast_service_model.dart';
import '../data/model/get_catalogue_services_model.dart';
import '../data/model/request_salon_service_details_model.dart';
import '../data/remote_data_source/fast_service_remote_data_source.dart';
import '../domain/domain/entities/request_profile_service_entity.dart';
import '../domain/repository/fast_service_repository.dart';

class FastRepositoryImpl implements FastServiceRepository {

  final FastServiceRemoteDataSource remoteDataSource;

  FastRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Catalogue>> getCatalogue() async => remoteDataSource.getCatalogue();
  Future<GetCatalogueService> getCatalogueServices(int id) async => remoteDataSource.getCatalogueServices(id);
  Future<RequestSalonServiceDetailsModel> requestSalonService(RequestProfileServiceEntity data) async => remoteDataSource.requestSalonService(data);
}