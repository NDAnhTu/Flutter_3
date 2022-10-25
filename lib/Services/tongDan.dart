import 'dart:convert';
import 'package:flutter_3/model/sick.dart';
import 'package:flutter_3/model/tongDan.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TongDan_List {
  static const String url = "http://evg.vn/evg/api/app/app_cowInHTX";

  static Future<List<TongDan>> getTongDan() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String credential = prefs.getString('basicCredential').toString();
      final response = await http.post(Uri.parse(url), headers: {
        'Authorization': credential,
        "Content-Type": "application/json"
      });
      if (200 == response.statusCode) {
        var data = jsonDecode(response.body)["giaSucs"];
        return List<TongDan>.from(
            data.map((v) => TongDan.fromJson(v)).toList());
      } else {
        return <TongDan>[];
      }
    } catch (e) {
      return <TongDan>[];
    }
  }
}
