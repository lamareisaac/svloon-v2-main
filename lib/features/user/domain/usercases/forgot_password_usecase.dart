








import '../repository/user_repository.dart';

class ForgotPasswordUseCase{
  final UserRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<void> call(String email){
    return repository.forgotPassord(email);
  }
}