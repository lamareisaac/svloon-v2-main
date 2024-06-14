

import '../../data/model/fast_service_model.dart';
import '../../data/model/get_catalogue_services_model.dart';
import '../repository/fast_service_repository.dart';

class GetCatalogueServiceUseCase{
  final FastServiceRepository repository;

  GetCatalogueServiceUseCase({required this.repository});

  Future<GetCatalogueService> call(int id){
    return repository.getCatalogueServices(id);
  }
}