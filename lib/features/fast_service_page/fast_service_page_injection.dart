

import '../injection_container.dart';
import 'data/remote_data_source/fast_service_remote_data_source.dart';
import 'data/remote_data_source/fast_service_remote_data_source_impl.dart';
import 'domain/repository/fast_service_repository.dart';

import 'domain/usercases/get_catalogue_services.dart';
import 'domain/usercases/get_service_usecase.dart';

import 'domain/usercases/request_salon_service_usecase.dart';
import 'presentation/cubit/catalogue/get_catalogue_services_cubit.dart';
import 'presentation/cubit/get_service_cubit.dart';
import 'presentation/cubit/request_service/request_salon_service_cubit.dart';
import 'repository/fast_service_repository_impl.dart';

Future<void> fastServiceInjectionContainer() async {
  //Cubit or Bloc
  sl.registerFactory<GetServiceCubit>(() => GetServiceCubit(
      getSalonsUseCase: sl.call(),
     ));
  sl.registerFactory<RequestSalonServiceCubit>(() => RequestSalonServiceCubit(
      requestSalonServiceServiceUserCase: sl.call(),
     ));
  sl.registerFactory<GetCatalogueServicesCubit>(() => GetCatalogueServicesCubit(
      getCatalogueServiceUseCase: sl.call(),
     ));


  //UseCases
  sl.registerLazySingleton<GetSalonsUseCase>(
      () => GetSalonsUseCase(repository: sl.call()));

  sl.registerLazySingleton<RequestSalonServiceUserCase>(
      () => RequestSalonServiceUserCase(repository: sl.call()));

  sl.registerLazySingleton<GetCatalogueServiceUseCase>(
      () => GetCatalogueServiceUseCase(repository: sl.call()));



  //Repository
  sl.registerLazySingleton<FastServiceRepository>(
      () => FastRepositoryImpl(remoteDataSource: sl.call()));

   // RemoteDataSource

  sl.registerLazySingleton<FastServiceRemoteDataSource>(() => FastServiceRemoteDataSourceImpl(
      ));
}
