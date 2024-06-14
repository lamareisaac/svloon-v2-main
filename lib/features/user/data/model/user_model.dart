// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
    String firstname;
    String lastname;
    String name;
    String dialCode;
    String phoneNumber;
    String profession;
    String photoUrl;
    String isActive;
    String isProfessional;
    String email;
    dynamic emailVerifiedAt;
    String userTypeId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    UserModel({
        required this.firstname,
        required this.lastname,
        required this.name,
        required this.dialCode,
        required this.phoneNumber,
        required this.profession,
        required this.photoUrl,
        required this.isActive,
        required this.isProfessional,
        required this.email,
        required this.emailVerifiedAt,
        required this.userTypeId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    
    

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'name': name,
      'dialCode': dialCode,
      'phoneNumber': phoneNumber,
      'profession': profession,
      'photoUrl': photoUrl,
      'isActive': isActive,
      'isProfessional': isProfessional,
      'email': email,
      'emailVerifiedAt': emailVerifiedAt,
      'userTypeId': userTypeId,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      name: map['name'] as String,
      dialCode: map['dialCode'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profession: map['profession'] as String,
      photoUrl: map['photoUrl'] as String,
      isActive: map['isActive'] as String,
      isProfessional: map['isProfessional'] as String,
      email: map['email'] as String,
      emailVerifiedAt: map['emailVerifiedAt'] as dynamic,
      userTypeId: map['userTypeId'] as String,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
