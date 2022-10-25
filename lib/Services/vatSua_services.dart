import 'dart:convert';
import 'package:flutter_3/model/giaSucs.dart';
import 'package:flutter_3/model/vatSuas.dart';
import 'package:flutter_3/model/viSinh.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VatSuaServices {
  static const String url = "http://evg.vn/evg/api/app/app_VatSuaNongHo";

  static Future<List<VatSua>> getVatSua() async {
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
        //print(response.body);
        var data = jsonDecode(response.body)["vatSuas"];
        return List<VatSua>.from(data.map((v) => VatSua.fromJson(v)));
      } else {
        return <VatSua>[];
      }
    } catch (e) {
      return <VatSua>[];
    }
  }
}
