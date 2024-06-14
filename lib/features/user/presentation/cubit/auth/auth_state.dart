part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

 class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => [];
}

 class Authenticated extends AuthState {
   final String uid;
    final User user;
    const Authenticated({ required this.uid, required this.user});

  @override
  List<Object> get props => [uid];
}
 class UnAuthenticated extends AuthState {
  const UnAuthenticated();

  @override
  List<Object> get props => [];
}
