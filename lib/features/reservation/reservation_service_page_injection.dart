

import 'package:svloon2/features/Location/domain/repository/location_saved_repository.dart';
import 'package:svloon2/features/reservation/data/remote_data_source/reservation_remote_data_source.dart';

import '../injection_container.dart';

import 'data/remote_data_source/reservation_remote_data_source_impl.dart';
import 'domain/repository/reservation_repository.dart';
import 'domain/usercases/get_reservation_usecase.dart';
import 'presentation/cubit/reservation_cubit.dart';
import 'repository/reservation_repository_impl.dart';

Future<void> reservationInjectionContainer() async {
  //Cubit or Bloc
  sl.registerFactory<ReservationHistoryCubit>(() => ReservationHistoryCubit(
      getReservationHistoryCase: sl.call(),
     ));
     
 


  //UseCases
  sl.registerLazySingleton<GetReservationHistoryCase>(
      () => GetReservationHistoryCase(repository: sl.call()));




  //Repository
  sl.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl(remoteDataSource: sl.call()));

   // RemoteDataSource

  sl.registerLazySingleton<ReservationRemoteDataSource>(() => ReservationRemoteDataSourceImpl(
      ));
}
