import 'dart:convert';
import 'package:flutter_3/model/sick.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Sick_List {
  static const String url = "http://evg.vn/evg/api/app/app_danhSachBenh";

  static Future<List<Sick>> getSickList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String credential = prefs.getString('basicCredential').toString();
      final response = await http.post(Uri.parse(url), headers: {
        'Authorization': credential,
        "Content-Type": "application/json"
      });
      if (200 == response.statusCode) {
        var data = jsonDecode(response.body)["benhs"];
        return List<Sick>.from(data.map((v) => Sick.fromJson(v)).toList());
      } else {
        return <Sick>[];
      }
    } catch (e) {
      return <Sick>[];
    }
  }
}
