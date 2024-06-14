import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{

  final String? firstname;
  final String? email;
  final String? lastname;
  final String? dial_code;
  final String? phone_number;
  final String? profession;
  final String? photo_url;
  final String? is_active;
  final String? is_professional;
  final String? user_type_id;
  final String? password;

  UserEntity({ this.firstname,  this.email,  this.lastname,  this.dial_code,  this.phone_number,  this.profession,  this.photo_url,  this.is_active,  this.is_professional,  this.user_type_id,  this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [firstname, email, lastname, dial_code, phone_number, password, profession, photo_url, is_active, is_professional, user_type_id];

  
}