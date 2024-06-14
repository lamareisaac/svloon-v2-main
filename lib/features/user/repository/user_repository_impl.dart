

import 'package:svloon2/features/user/data/model/user_info_model.dart';

import '../data/model/user_model.dart';
import '../data/remote_data_source/user_remote_data_source.dart';
import '../domain/domain/entities/user_entity.dart';
import '../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> forgotPassord(String email) async => remoteDataSource.forgotPassord(email);

    Future<String?> getCurrentUId(String token) => remoteDataSource.getCurrentUId(token);

  @override
  Future<void> googleAuth() async => remoteDataSource.googleAuth();

  @override

  @override
  Future<void> signIn(UserEntity user) async => remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

    @override
  Future<bool> isSignin() async => remoteDataSource.isSignin();
  
  @override
  Future<User> getUserInfos() async => remoteDataSource.getUserInfos();
  
}