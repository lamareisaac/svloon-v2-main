

import '../../data/model/location_saved_model.dart';
import '../repository/location_saved_repository.dart';

class GetLocationSavedUseCase{
  final LocationSavedRepository repository;

  GetLocationSavedUseCase({required this.repository});

  Future<List<UserLocationSaved>> call(){
    return repository.getUserLocationSaved();
  }
}