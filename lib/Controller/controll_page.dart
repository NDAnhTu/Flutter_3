import 'package:flutter/material.dart';
import 'package:flutter_3/Page/hauBi_page.dart';
import 'package:flutter_3/Page/sinhSan_page.dart';
import 'package:flutter_3/Page/timKiem_page.dart';
import 'package:flutter_3/Page/vatSua_page.dart';
import 'package:flutter_3/Page/xaVien_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> screens = [
    XaVien_Page(),
    SinhSan_page(),
    TimKiem_Page(),
    HauBi_page(),
    VatSua_page(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: GNav(
          selectedIndex: _currentIndex,
          tabBackgroundColor: Color.fromARGB(255, 178, 224, 126),
          padding: EdgeInsets.all(9),
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: ' XÃ VIÊN',
            ),
            GButton(
              icon: Icons.fiber_smart_record,
              text: ' SINH SẢN',
            ),
            GButton(
              icon: Icons.search,
              text: ' TÌM KIẾM',
            ),
            GButton(
              icon: Icons.dashboard,
              text: ' HẬU BỊ',
            ),
            GButton(
              icon: Icons.error,
              text: ' VẮT SỮA',
            ),
          ],
        ),
      ),
    );
  }
}
