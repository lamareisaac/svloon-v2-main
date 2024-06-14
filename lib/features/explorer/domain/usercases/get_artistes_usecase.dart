

import '../../data/model/artists_model.dart';
import '../../data/model/salon_model.dart';
import '../repository/salon_service_repository.dart';

class GetArtistesUseCase{
  final SalonServiceRepository repository;

  GetArtistesUseCase({required this.repository});

  Future<List<Artistes>> call(){
    return repository.getArtistes();
  }
}