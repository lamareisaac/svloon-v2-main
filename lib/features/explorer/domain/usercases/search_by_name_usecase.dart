


import '../../data/model/salon_model.dart';
import '../repository/salon_service_repository.dart';

class SearchByNameUseCase{
  final SalonServiceRepository repository;

  SearchByNameUseCase({required this.repository});

  Future<List<SalonModel>> call(String name){
    return repository.searchByName(name);
  }
}