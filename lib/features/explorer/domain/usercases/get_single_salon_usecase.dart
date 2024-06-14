

import '../../data/model/salon_model.dart';
import '../../data/model/single_salon_service_model.dart';
import '../repository/salon_service_repository.dart';

class GetSingleSalonUseCase{
  final SalonServiceRepository repository;

  GetSingleSalonUseCase({required this.repository});

  Future<SingleSalonModel> call(int id){
    return repository.getSingleSalon(id);
  }
}