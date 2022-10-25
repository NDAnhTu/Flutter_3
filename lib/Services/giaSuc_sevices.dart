import 'dart:convert';
import 'package:flutter_3/model/giaSucs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GiaSucServices {
  static const String url = "http://evg.vn/evg/api/app/app_GiaSucTheoHo";
  static Future<List<GiaSuc>> getGiaSuc() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String credential = prefs.getString('basicCredential').toString();
      int idchuho = prefs.getInt('idchuho')!;
      final response = await http.post(Uri.parse(url),
          body: json.encode(idchuho),
          headers: {
            'Authorization': credential,
            "Content-Type": "application/json"
          });
      if (200 == response.statusCode) {
        var data = jsonDecode(response.body)["giaSucs"];
        return List<GiaSuc>.from(data.map((v) => GiaSuc.fromJson(v)));
      } else {
        return <GiaSuc>[];
      }
    } catch (e) {
      return <GiaSuc>[];
    }
  }
}
