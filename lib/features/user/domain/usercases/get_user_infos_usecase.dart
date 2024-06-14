






import 'package:svloon2/features/user/data/model/user_info_model.dart';

import '../repository/user_repository.dart';

class GetUserInfoUseCase{
  final UserRepository repository;

  GetUserInfoUseCase({required this.repository});
  Future<User> call()async{
    return await repository.getUserInfos();
  }
}