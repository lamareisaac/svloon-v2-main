

import 'package:svloon2/features/explorer/data/model/artist_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';

import '../data/model/artists_model.dart';
import '../data/model/salon_model.dart';
import '../data/model/single_salon_service_model.dart';
import '../data/remote_data_source/salon_service_remote_data_source.dart';
import '../domain/repository/salon_service_repository.dart';

class SalonServiceRepositoryImpl implements SalonServiceRepository {

  final SalonServiceRemoteDataSource remoteDataSource;

  SalonServiceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<SalonModel>> getSalons() async => remoteDataSource.getSalons();
  @override
  Future<List<SalonModel>> searchByName(String name) async => remoteDataSource.searchByName(name);
  @override
  Future<List<Artistes>> getArtistes() async => remoteDataSource.getArtistes();
  @override
  Future<SingleSalonModel> getSingleSalon(int id) async => remoteDataSource.getSingleSalon(id);
  @override
  @override
  Future<List<SalonFavoris>> getSalonFavoris() async => remoteDataSource.getSalonFavoris();
  
  @override
  Future<List<ArtistFavoris>> getArtistFavoris() async => remoteDataSource.getArtistFavoris();

  
}