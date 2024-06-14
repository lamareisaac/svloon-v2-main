

import 'package:svloon2/features/explorer/domain/usercases/get_artists_favoris.dart';
import 'package:svloon2/features/explorer/domain/usercases/get_salon_favoris.dart';
import 'package:svloon2/features/explorer/presentation/cubit/artistes/select_random_artist/select_artist_cubit.dart';
import 'package:svloon2/features/explorer/presentation/cubit/favoris/get_favoris_cubit.dart';

import '../injection_container.dart';
import 'data/remote_data_source/salon_service_remote_data_source.dart';
import 'data/remote_data_source/salon_service_remote_data_source_impl.dart';
import 'domain/repository/salon_service_repository.dart';

import 'domain/usercases/get_artistes_usecase.dart';
import 'domain/usercases/get_service_usecase.dart';

import 'domain/usercases/get_single_salon_usecase.dart';
import 'domain/usercases/search_by_name_usecase.dart';
import 'presentation/cubit/artistes/artistes_cubit.dart';
import 'presentation/cubit/get_single_salon_cubit.dart';
import 'presentation/cubit/salon_cubit.dart';
import 'repository/salon_service_repository_impl.dart';

Future<void> salonServiceInjectionContainer() async {
  //Cubit or Bloc
  sl.registerFactory<SalonCubit>(() => SalonCubit(
      getSalonModelUseCase: sl.call(),
      searchByNameUseCase: sl.call(),
     ));
     
  sl.registerFactory<GetSingleSalonCubit>(() => GetSingleSalonCubit(
      getSingleSalonUseCase: sl.call(),
     ));
  sl.registerFactory<ArtistesCubit>(() => ArtistesCubit(
      getArtistesUseCase: sl.call(),
     ));
  sl.registerFactory<GetFavorisCubit>(() => GetFavorisCubit(
      getSalonFavorisUseCase: sl.call(),
      getArtistFavorisUseCase: sl.call(),
     ));
  sl.registerFactory<SelectArtistCubit>(() => SelectArtistCubit(
     ));


  //UseCases
  sl.registerLazySingleton<GetSalonModelUseCase>(
      () => GetSalonModelUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetSingleSalonUseCase>(
      () => GetSingleSalonUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetArtistesUseCase>(
      () => GetArtistesUseCase(repository: sl.call()));
  sl.registerLazySingleton<SearchByNameUseCase>(
      () => SearchByNameUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetSalonFavorisUseCase>(
      () => GetSalonFavorisUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetArtistFavorisUseCase>(
      () => GetArtistFavorisUseCase(repository: sl.call()));



  //Repository
  sl.registerLazySingleton<SalonServiceRepository>(
      () => SalonServiceRepositoryImpl(remoteDataSource: sl.call()));

   // RemoteDataSource

  sl.registerLazySingleton<SalonServiceRemoteDataSource>(() => SalonServiceRemoteDataSourceImpl(
      ));
}
