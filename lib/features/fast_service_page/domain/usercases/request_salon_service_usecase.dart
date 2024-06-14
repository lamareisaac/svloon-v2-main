import '../../data/model/request_salon_service_details_model.dart';
import '../domain/entities/request_profile_service_entity.dart';
import '../repository/fast_service_repository.dart';

class RequestSalonServiceUserCase{
  final FastServiceRepository repository;

  RequestSalonServiceUserCase({required this.repository});

  Future<RequestSalonServiceDetailsModel> call(RequestProfileServiceEntity data){
    return repository.requestSalonService(data);
  }
}