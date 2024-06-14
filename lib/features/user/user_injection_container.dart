

import 'package:svloon2/features/user/domain/usercases/get_user_infos_usecase.dart';

import '../injection_container.dart';
import 'data/remote_data_source/user_remote_data_source.dart';
import 'data/remote_data_source/user_remote_data_source_impl.dart';
import 'domain/repository/user_repository.dart';
import 'domain/usercases/forgot_password_usecase.dart';
import 'domain/usercases/get_current_uid_usecase.dart';
import 'domain/usercases/google_auth_usecase.dart';
import 'domain/usercases/is_sign_in_usecase.dart';
import 'domain/usercases/sign_in_usecase.dart';
import 'domain/usercases/sign_out_usecase.dart';
import 'domain/usercases/sign_up_usecase.dart';
import 'presentation/cubit/auth/auth_cubit.dart';
import 'presentation/cubit/credential/credential_cubit.dart';
import 'repository/user_repository_impl.dart';

Future<void> userInjectionContainer() async {
  //Cubit or Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getUserInfoUseCase: sl.call(),
      getCurrentUIDUseCase: sl.call()));

  

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      forgotPasswordUseCase: sl.call(),
      googleAuthUseCase: sl.call(),
      signInUseCase: sl.call(),
      signUpUseCase: sl.call()));

  //UseCases
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetCurrentUIDUseCase>(
      () => GetCurrentUIDUseCase(repository: sl.call()));
 
  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUserInfoUseCase>(
      () => GetUserInfoUseCase(repository: sl.call()));

  //Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

   // RemoteDataSource

  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      ));
}
