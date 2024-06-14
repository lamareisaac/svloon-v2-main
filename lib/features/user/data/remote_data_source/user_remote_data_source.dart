

import 'package:svloon2/features/user/data/model/user_info_model.dart';

import '../../domain/domain/entities/user_entity.dart';
import '../model/user_model.dart';

abstract class UserRemoteDataSource{

   Future<void> googleAuth();

  Future<void> forgotPassord(String email);
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<bool> isSignin();
  Future<String?> getCurrentUId(String token);
  Future<User> getUserInfos();



  
}