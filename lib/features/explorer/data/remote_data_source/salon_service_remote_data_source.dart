

import 'package:svloon2/features/explorer/data/model/artist_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_services_model.dart';

import '../model/artists_model.dart';
import '../model/salon_model.dart';
import '../model/single_salon_service_model.dart';

abstract class SalonServiceRemoteDataSource{

   Future<List<SalonModel>> getSalons();
   Future<List<SalonModel>> searchByName(String name);
   Future<List<Artistes>> getArtistes();
   Future<List<SalonFavoris>> getSalonFavoris();
   Future<List<ArtistFavoris>> getArtistFavoris();
   Future<SingleSalonModel>getSingleSalon(int id);




  
}