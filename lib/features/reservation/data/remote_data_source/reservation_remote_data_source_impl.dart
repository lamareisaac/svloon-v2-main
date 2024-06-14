import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:svloon2/features/reservation/data/model/reservation_history_model.dart';
import 'package:svloon2/features/reservation/data/remote_data_source/reservation_remote_data_source.dart';
import 'dart:convert' as convert;

class ReservationRemoteDataSourceImpl implements ReservationRemoteDataSource  {
  String url = "http://svloon.com/api/";

  final jsonEncoder = JsonEncoder();
  FlutterSecureStorage storage = FlutterSecureStorage();


  ReservationRemoteDataSourceImpl();

  @override
  Future<List<ReservationHistory>> getReservationHistory() async {
    String? value = await storage.read(key: 'token');
    var response = await http.get(Uri.parse("${url}auth/get-appointements"),
        headers: {"Content-Type": "application/json", "Authorization": "Bearer ${value!}"});
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      var results = json['data'] as List;
      return results.map((v) => ReservationHistory.fromJson(v)).toList();
    } else {
      var json = convert.jsonDecode(response.body);
      throw Exception("Quelque chose s'est mal passé, veuillez réessayer !");
    }
  }

}
