import 'dart:convert';
import 'package:flutter_3/model/giaSucs_Detail.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GiaSucDetailServices {
  static const String url = "http://evg.vn/evg/api/app/app_chiTietGiaSuc";
  static Future<List<GiaSucDetail>> getGiaSucDetail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String credential = prefs.getString('basicCredential').toString();
      int idgiasuc = prefs.getInt('idgiasuc')!;
      final response = await http.post(Uri.parse(url),
          body: json.encode(idgiasuc),
          headers: {
            'Authorization': credential,
            "Content-Type": "application/json"
          });
      if (200 == response.statusCode) {
        var data = jsonDecode(response.body)["cows"];
        var parsed =
            List<GiaSucDetail>.from(data.map((v) => GiaSucDetail.fromJson(v)));
        return parsed;
      } else {
        return <GiaSucDetail>[];
      }
    } catch (e) {
      return <GiaSucDetail>[];
    }
  }
}
