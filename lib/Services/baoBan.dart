import 'dart:convert';
import 'package:flutter_3/model/khamThai.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CanSuaServices {
  static const String url =
      "http://evg.vn/evg/api/app/app_ChoCanSuas?page=1" + "&size=20";

  static Future<List<KhamThai>> getCanSua() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String credential = prefs.getString('basicCredential').toString();
      final response = await http
          .post(Uri.parse(url), headers: {'Authorization': credential});
      if (200 == response.statusCode) {
        var data = jsonDecode(response.body)["content"];
        return List<KhamThai>.from(data.map((x) => KhamThai.fromJson(x)));
      } else {
        return <KhamThai>[];
      }
    } catch (e) {
      return <KhamThai>[];
    }
  }
}
