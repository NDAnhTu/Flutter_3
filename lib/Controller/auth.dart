import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_controller.dart';

class AuthServices {
  Future<bool> login() async {
    final prefs = await SharedPreferences.getInstance();
    String? status = prefs.getString('status');
    await prefs.setString(
        'status', LoginController().googleAccount.value.toString());
    if (status != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('status', '');
    prefs.clear();
    return true;
  }
}
