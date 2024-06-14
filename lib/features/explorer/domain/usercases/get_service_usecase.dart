

import '../../data/model/salon_model.dart';
import '../repository/salon_service_repository.dart';

class GetSalonModelUseCase{
  final SalonServiceRepository repository;

  GetSalonModelUseCase({required this.repository});

  Future<List<SalonModel>> call(){
    return repository.getSalons();
  }
}