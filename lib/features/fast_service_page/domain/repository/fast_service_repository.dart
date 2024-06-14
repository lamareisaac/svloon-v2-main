

import '../../data/model/fast_service_model.dart';
import '../../data/model/get_catalogue_services_model.dart';
import '../../data/model/request_salon_service_details_model.dart';
import '../domain/entities/request_profile_service_entity.dart';

abstract class FastServiceRepository {
  Future<List<Catalogue>> getCatalogue();
  Future<GetCatalogueService> getCatalogueServices(int id);
  Future<RequestSalonServiceDetailsModel> requestSalonService(RequestProfileServiceEntity data);



}