






import '../repository/user_repository.dart';

class GetCurrentUIDUseCase{
  final UserRepository repository;

  GetCurrentUIDUseCase({required this.repository});
  Future<String?> call(String token)async{
    return await repository.getCurrentUId(token);
  }
}