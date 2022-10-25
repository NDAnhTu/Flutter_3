import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/controll_page.dart';
import 'package:flutter_3/Page/login_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_3/Controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _status = false;

  void initState() {
    loadStatus();
    super.initState();
  }

  @override
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSplashScreen(
            splash: Container(
              //color: Colors.amber,
              child: Image.asset('assets/images/splash/logo.png'),
            ),
            duration: 1000,
            splashTransition: SplashTransition.scaleTransition,
            splashIconSize: 120,
            pageTransitionType: PageTransitionType.bottomToTop,
            nextScreen: _status == true ? HomeScreen() : LoginScreen(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Image.asset(
                  'assets/images/splash/powered_by.png',
                  height: 40,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _status = prefs.containsKey("basicCredential");
    });
  }
}
