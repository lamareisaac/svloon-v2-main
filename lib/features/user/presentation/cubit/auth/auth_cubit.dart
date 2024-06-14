import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svloon2/features/global/common/common.dart';
import 'package:svloon2/features/user/data/model/user_info_model.dart';
import 'package:svloon2/features/user/domain/usercases/get_user_infos_usecase.dart';

import '../../../domain/usercases/get_current_uid_usecase.dart';
import '../../../domain/usercases/is_sign_in_usecase.dart';
import '../../../domain/usercases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUIDUseCase getCurrentUIDUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;

  FlutterSecureStorage storage = FlutterSecureStorage();


  AuthCubit(
      {required this.isSignInUseCase,
      required this.signOutUseCase,
      required this.getUserInfoUseCase,
      required this.getCurrentUIDUseCase
      })
      : super(AuthInitial());

  Future<void> appStated() async {
    try {
      final isSignIn = await isSignInUseCase.call();

      if (isSignIn == true) {
        final userInfos = await getUserInfoUseCase.call();
        final uid = await getCurrentUIDUseCase.call("token");

        emit(Authenticated(uid: uid!, user: userInfos));
        
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      toast(_.toString());
      emit(UnAuthenticated());
      
    }
  }

  Future<void> loggedIn() async {
    emit(AuthInitial());
    try {
      final uid = await getCurrentUIDUseCase.call("token");
      print(uid);
      await Future.delayed(Duration(seconds: 1));
      final userInfos = await getUserInfoUseCase.call();
      emit(Authenticated(uid: uid!, user: userInfos));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(AuthInitial());
      Future.delayed(const Duration(seconds: 2), (){
        emit(UnAuthenticated());
      });
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
