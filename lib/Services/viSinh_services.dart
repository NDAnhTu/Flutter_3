import 'dart:convert';
import 'package:flutter_3/model/viSinh.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ViSinhServices {
  static const String url = "http://evg.vn/evg/api/app/app_ViSinhNongHo";

  static Future<List<ViSinh>> getViSinh() async {
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
        var data = jsonDecode(response.body)["viSinhs"];
        return List<ViSinh>.from(data.map((v) => ViSinh.fromJson(v)));
      } else {
        return <ViSinh>[];
      }
    } catch (e) {
      return <ViSinh>[];
    }
  }
}
