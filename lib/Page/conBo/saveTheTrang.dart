import 'package:http/http.dart' as http;

Future<String> saveDoTheTrang(String data) async {
  String url = "http://evg.vn/evg/api/app/app_canGiaSuc";
  var response = await http.post(Uri.parse(url),
      body: data, headers: {"content-type": "application/json"});
  print(response.body);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return "0";
  }
}
