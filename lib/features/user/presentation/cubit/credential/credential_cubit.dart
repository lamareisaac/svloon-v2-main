 import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/domain/entities/user_entity.dart';
import '../../../domain/usercases/forgot_password_usecase.dart';
import '../../../domain/usercases/google_auth_usecase.dart';
import '../../../domain/usercases/sign_in_usecase.dart';
import '../../../domain/usercases/sign_up_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GoogleAuthUseCase googleAuthUseCase;
  CredentialCubit({ required this.signUpUseCase,required this.signInUseCase, required this.forgotPasswordUseCase, required this.googleAuthUseCase}) : super(CredentialInitial());


  Future<void> forgotPassord({required String email}) async{
    try {
      await forgotPasswordUseCase.call(email);
      
    } on SocketException catch (_){
      emit(CredentialFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(CredentialFailure(error: _.toString()));
    }
  }
  Future<void> signInSubmit({required String email, required String password}) async{
    emit(CredentialLoading());
    try {
      await signInUseCase.call(UserEntity(email: email, password: password));
      emit(CredentialSuccess());
      
    } on SocketException catch (_){
      emit(CredentialFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(CredentialFailure(error: _.toString()));
    }
  }
  Future<void> signUpSubmit({required UserEntity user}) async{
    emit(CredentialLoading());
    try {
     await signUpUseCase.call(user);
      emit(CredentialSuccess());
      
    } on SocketException catch (_){
      emit(CredentialFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(CredentialFailure(error: _.toString()));
    }
  }
  Future<void> googleAuthSubmit({required UserEntity user}) async{
    emit(CredentialLoading());
    try {
      await googleAuthUseCase.call();
      //emit(CredentialSuccess());
      
    } on SocketException catch (_){
      emit(CredentialFailure(error: _.toString()));
    }
    
    catch (_) {
    emit(CredentialFailure(error: _.toString()));
    }
  }
}
