

import '../../domain/domain/entities/request_profile_service_entity.dart';
import '../model/fast_service_model.dart';
import '../model/get_catalogue_services_model.dart';
import '../model/request_salon_service_details_model.dart';

abstract class FastServiceRemoteDataSource{

   Future<List<Catalogue>> getCatalogue();
   Future<GetCatalogueService> getCatalogueServices(int id);
   Future<RequestSalonServiceDetailsModel> requestSalonService(RequestProfileServiceEntity data);




  
}