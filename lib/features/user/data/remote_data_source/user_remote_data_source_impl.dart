import 'dart:convert';

 
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:svloon2/features/user/data/model/user_info_model.dart';

import '../../domain/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  String url = "http://svloon.com/api/";
 FlutterSecureStorage storage = FlutterSecureStorage();

  final jsonEncoder = JsonEncoder();

  UserRemoteDataSourceImpl();

  @override
  Future<void> forgotPassord(String email) async {}

  @override
  Future<void> googleAuth() {
    // TODO: implement googleAuth
    throw UnimplementedError();
  }

   @override
  Future<bool> isSignin() async{
     /// read from keystore/keychain
    String? value = await storage.read(key: 'token');

    await Future.delayed(Duration(seconds: 1));
    if(value != null){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Future<String?> getCurrentUId(String token) async => await storage.read(key: 'token');


  @override
  Future<void> signIn(UserEntity user) async {
     var response = await http.post(Uri.parse("${url}auth/login"),
        body: jsonEncoder.convert({
    
          "email": user.email,
          "password": user.password,
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
       await storage.write(key: 'token', value: json['access_token']);
      
    } else if(response.statusCode == 401){
      throw Exception("Email ou mot de passe incorrect !");
    } 
    
    else {
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }
  @override
  Future<User> getUserInfos() async {
      String? token = await storage.read(key: 'token');
     var response = await http.post(Uri.parse("${url}auth/me"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token!}",
        });
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      return User.fromJson(json);
      
    }
    else {
      throw Exception("Impossible de récupérer les informations de l'utilisateur");
    }
  }

  @override
  Future<void> signOut() async {
    await  storage.delete(key: 'token');
  }

  @override
  Future<void> signUp(UserEntity user) async {
    var response = await http.post(Uri.parse(url + "sign-up"),
        body: jsonEncoder.convert({
          "firstname": user.firstname,
          "lastname": user.lastname,
          "email": user.email,
          "dial_code": user.dial_code,
          "phone_number": user.phone_number,
          "profession": user.profession,
          "is_active": "1",
          "is_professional": "0",
          "user_types_id": "2",
          "password": user.password,
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });
    if (response.statusCode == 201) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'];
       await storage.write(key: 'token', value: json['data']['phone_number']);
      await Future.delayed(Duration(seconds: 1));

     } else {
      var json = convert.jsonDecode(response.body);

      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }
}
