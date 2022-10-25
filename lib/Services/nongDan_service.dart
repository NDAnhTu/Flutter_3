import 'dart:convert';
import 'package:flutter_3/model/nongDans.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NongDanServices {
  static const String url = "http://evg.vn/evg/api/app/app_DanHSachNongDan";

  static Future<List<NongDan>> getNongDan() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String credential = prefs.getString('basicCredential').toString();
      final response = await http
          .post(Uri.parse(url), headers: {'Authorization': credential});
      if (200 == response.statusCode) {
        var data = jsonDecode(response.body)["nongDans"];
        var parsed = List<NongDan>.from(data.map((x) => NongDan.fromJson(x)));
        //print(parsed[0].id);
        return parsed;
      } else {
        return <NongDan>[];
      }
    } catch (e) {
      return <NongDan>[];
    }
  }
}
