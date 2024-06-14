import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:svloon2/features/global/common/common.dart';

import '../../domain/domain/entities/fast_service_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../domain/domain/entities/request_profile_service_entity.dart';
import '../model/fast_service_model.dart';
import '../model/get_catalogue_services_model.dart';
import '../model/request_salon_service_details_model.dart';
import 'fast_service_remote_data_source.dart';

class FastServiceRemoteDataSourceImpl implements FastServiceRemoteDataSource {
  String url = "http://svloon.com/api/";

  final jsonEncoder = JsonEncoder();
  FlutterSecureStorage storage = FlutterSecureStorage();

  FastServiceRemoteDataSourceImpl();

  @override
  Future<List<Catalogue>> getCatalogue() async {
    var response = await http.get(Uri.parse(url + "service-types"),
        headers: {"Content-Type": "application/json", "X-CSRF-TOKEN": ""});
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'] as List;
      return results.map((v) => Catalogue.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }

  @override
  Future<RequestSalonServiceDetailsModel> requestSalonService(
      RequestProfileServiceEntity data) async {
    String? token = await storage.read(key: 'token');
    var response =
        await http.post(Uri.parse("${url}auth/create-appointements"),
            body: jsonEncoder.convert({
              "user_id": data.userId,
              "artist_id": data.artistId,
              "salon_id": data.salonId,
              "date": data.date,
              "hour": data.hour,
              "details": data.details,
              "instructions": data.instructions,
              "salon_service_id": data.salonServiceId,
              "service_id": data.serviceId,
              "date_time": "",
              "is_confirmed": true,
              "is_report": false,
              "is_cancel": false,
              "report_date": ""
            }),
            headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token!}",
        });
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      var results = json['data'];
      toast(json['message']);
      print(results);
      return RequestSalonServiceDetailsModel.fromJson(results);
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }

  @override
  Future<GetCatalogueService> getCatalogueServices(int id) async {
    var response = await http.get(Uri.parse(url + "services/${id}"),
        headers: {"Content-Type": "application/json", "X-CSRF-TOKEN": ""});
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'];
      return GetCatalogueService.fromJson(results);
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
