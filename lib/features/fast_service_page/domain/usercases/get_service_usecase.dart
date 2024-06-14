

import '../../data/model/fast_service_model.dart';
import '../repository/fast_service_repository.dart';

class GetSalonsUseCase{
  final FastServiceRepository repository;

  GetSalonsUseCase({required this.repository});

  Future<List<Catalogue>> call(){
    return repository.getCatalogue();
  }
}