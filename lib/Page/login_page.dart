import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/controll_page.dart';
import 'package:flutter_3/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () {
          if (controller.googleAccount.value == null)
            return loginButton();
          else
            return HomeScreen();
        },
      ),
    );
  }

  Scaffold loginButton() {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/images/app/background_2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 15.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 80.0),
              alignment: Alignment.topLeft,
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, style: BorderStyle.solid, width: 2.0),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/app/evg_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "EVERGROWTH",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 120.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      //shape: RoundedRectangleBorder(
                      //borderRadius: BorderRadius.circular(30.0)),
                      //color: Colors.white,
                      onPressed: () async {
                        controller.login();
                        //print('gmail ${user}');
                        try {
                          String url = 'http://evg.vn/evg/auth/loginApp';
                          return http
                              .post(Uri.parse(url),
                                  body: 'evergrowthtest@gmail.com')
                              .then(
                            (http.Response response) async {
                              if (response.statusCode == 200) {
                                AuthUser user = AuthUser.fromJson(
                                    json.decode(response.body));
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                var basicCredential =
                                    'Bearer ' + user.accessToken;
                                await prefs.setString(
                                    'basicCredential', basicCredential);
                              }
                            },
                          );
                        } catch (e) {
                          print('lỗi');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "ĐĂNG NHẬP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
