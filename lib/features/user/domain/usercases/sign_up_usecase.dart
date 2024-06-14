

import '../../data/model/user_model.dart';
import '../domain/entities/user_entity.dart';
import '../repository/user_repository.dart';

class SignUpUseCase{
  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user){
    return repository.signUp(user);
  }
}