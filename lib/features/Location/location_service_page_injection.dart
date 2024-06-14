

import '../injection_container.dart';

import 'data/remote_data_source/location_saved_remote_data_source.dart';
import 'data/remote_data_source/location_saved_remote_data_source_impl.dart';
import 'domain/repository/location_saved_repository.dart';
import 'domain/usercases/get_locations_saved_usecase.dart';
import 'presentation/cubit/location_saved_cubit.dart';
import 'repository/location_service_repository_impl.dart';

Future<void> savedLocationInjectionContainer() async {
  //Cubit or Bloc
  sl.registerFactory<LocationSavedCubit>(() => LocationSavedCubit(
      getLocationSavedUseCase: sl.call(),
     ));
     
 


  //UseCases
  sl.registerLazySingleton<GetLocationSavedUseCase>(
      () => GetLocationSavedUseCase(repository: sl.call()));




  //Repository
  sl.registerLazySingleton<LocationSavedRepository>(
      () => LocationSavedRepositoryImpl(remoteDataSource: sl.call()));

   // RemoteDataSource

  sl.registerLazySingleton<LocationSavedRemoteDataSource>(() => LocationSavedRemoteDataSourceImpl(
      ));
}
