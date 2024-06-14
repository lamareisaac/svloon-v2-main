


import '../data/model/location_saved_model.dart';

import '../data/remote_data_source/location_saved_remote_data_source.dart';
import '../domain/repository/location_saved_repository.dart';

class LocationSavedRepositoryImpl implements LocationSavedRepository {

  final LocationSavedRemoteDataSource remoteDataSource;

  LocationSavedRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<UserLocationSaved>> getUserLocationSaved() async => remoteDataSource.getUserLocationSaved();



  
}