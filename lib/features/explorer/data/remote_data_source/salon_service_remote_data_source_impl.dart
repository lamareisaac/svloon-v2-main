import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:svloon2/features/explorer/data/model/artist_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_favoris_model.dart';
import 'package:svloon2/features/explorer/data/model/salon_services_model.dart';
import 'package:svloon2/features/explorer/data/model/seach_salon_model.dart';
import 'dart:convert' as convert;

import '../model/artists_model.dart';
import '../model/salon_model.dart';
import '../model/single_salon_service_model.dart';
import 'salon_service_remote_data_source.dart';

class SalonServiceRemoteDataSourceImpl implements SalonServiceRemoteDataSource {
  String url = "http://svloon.com/api/";

  final jsonEncoder = JsonEncoder();
   FlutterSecureStorage storage = FlutterSecureStorage();


  SalonServiceRemoteDataSourceImpl();

  @override
  Future<List<SalonModel>> getSalons() async {
    var response = await http.get(Uri.parse("${url}salons"),
        headers: {"Content-Type": "application/json", "X-CSRF-TOKEN": ""});
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      print(response.body);
      var results = json['data'] as List;     
      return results.map((v) => SalonModel.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }
  @override
  Future<List<SalonFavoris>> getSalonFavoris() async {
        String? value = await storage.read(key: 'token');

    var response = await http.get(Uri.parse("${url}auth/favorite/salon"),
        headers: {
          "Content-Type": "application/json", 
          "Authorization": 'Bearer ${value!}'
          }
        );
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'] as List;
     
      return results.map((v) => SalonFavoris.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }
  @override
  Future<List<ArtistFavoris>> getArtistFavoris() async {
        String? value = await storage.read(key: 'token');

    var response = await http.get(Uri.parse("${url}auth/favorite/artist"),
        headers: {
          "Content-Type": "application/json", 
          "Authorization": 'Bearer ${value!}'
          }
        );
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'] as List;
     
      return results.map((v) => ArtistFavoris.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }

  @override
  Future<List<SalonModel>> searchByName(String name) async {
    var response = await http
        .get(Uri.parse(url + "salons/search_by_name?name=${name}"), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'] as List;
      return results.map((v) => SalonModel.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }

  @override
  Future<List<Artistes>> getArtistes() async {
    var response = await http.get(Uri.parse(url + "artists"),
        headers: {"Content-Type": "application/json", "X-CSRF-TOKEN": ""});
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'] as List;
      return results.map((v) => Artistes.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }

  @override
  Future<SingleSalonModel> getSingleSalon(int id) async {
    var response = await http.get(Uri.parse(url + "salons/${id}"),
        headers: {"Content-Type": "application/json", "X-CSRF-TOKEN": ""});
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'];
  
      return SingleSalonModel.fromJson(results);
    }
    if (response.statusCode == 404) {
      var json = convert.jsonDecode(response.body);
      throw Exception(json['message']);
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }


}
