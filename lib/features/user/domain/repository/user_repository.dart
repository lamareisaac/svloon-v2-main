
import 'package:svloon2/features/user/data/model/user_info_model.dart';

import '../../data/model/user_model.dart';
import '../domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> googleAuth();
  Future<void> forgotPassord(String email);
  Future<bool> isSignin();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String?> getCurrentUId(String token);
  Future<User> getUserInfos();


}