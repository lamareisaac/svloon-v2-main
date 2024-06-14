import 'package:svloon2/features/explorer/data/model/artist_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';

import '../../data/model/artists_model.dart';
import '../../data/model/salon_model.dart';
import '../../data/model/single_salon_service_model.dart';

abstract class SalonServiceRepository {
  Future<List<SalonModel>> getSalons();
  Future<List<SalonModel>> searchByName(String name);
  Future<List<SalonFavoris>> getSalonFavoris();
   Future<List<ArtistFavoris>> getArtistFavoris();

  Future<List<Artistes>> getArtistes();
  Future<SingleSalonModel> getSingleSalon(int id);
}
