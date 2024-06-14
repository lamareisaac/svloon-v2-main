import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/location_saved_model.dart';
import 'location_saved_remote_data_source.dart';

class LocationSavedRemoteDataSourceImpl implements LocationSavedRemoteDataSource  {
  String url = "http://svloon.com/api/";

  final jsonEncoder = JsonEncoder();

  LocationSavedRemoteDataSourceImpl();

  @override
  Future<List<UserLocationSaved>> getUserLocationSaved() async {
    var response = await http.get(Uri.parse(url + "user-addresses"),
        headers: {"Content-Type": "application/json", "X-CSRF-TOKEN": ""});
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      var results = json['data'] as List;
      return results.map((v) => UserLocationSaved.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }

}
