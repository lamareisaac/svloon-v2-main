

import 'package:svloon2/features/explorer/data/model/artist_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_services_model.dart';

import '../../data/model/single_salon_service_model.dart';
import '../repository/salon_service_repository.dart';

class GetArtistFavorisUseCase{
  final SalonServiceRepository repository;

  GetArtistFavorisUseCase({required this.repository});

  Future<List<ArtistFavoris>> call(){
    return repository.getArtistFavoris();
  }
}