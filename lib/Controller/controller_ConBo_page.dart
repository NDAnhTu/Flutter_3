// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_3/Page/conBo/conBo_page.dart';
import 'package:flutter_3/Services/giaSucDetail.dart';
import 'package:flutter_3/commons/chucNang_page.dart';
import 'package:flutter_3/commons/nhatKyBo_page.dart';
import 'package:flutter_3/model/giaSucs_Detail.dart';

class Controller_ConBo_Page extends StatefulWidget {
  const Controller_ConBo_Page({Key? key}) : super(key: key);

  @override
  State<Controller_ConBo_Page> createState() => _Controller_ConBo_PageState();
}

class _Controller_ConBo_PageState extends State<Controller_ConBo_Page> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  late List<GiaSucDetail> _gsdetail;
  String _tenChuHo = ' ';
  String _soTai = ' ';
  String _trongLuong = ' ';
  String _theTrang = ' ';
  String _namTuoi = ' ';
  late bool _loading;

  @override
  void initState() {
    _gsdetail = [];
    super.initState();
    _loading = true;
    GiaSucDetailServices.getGiaSucDetail().then(
      (gsdetail) {
        setState(
          () {
            _loading = false;
            _gsdetail = gsdetail;
            _tenChuHo = _gsdetail[0].tenNongDan.toString();
            _soTai = _gsdetail[0].soTai.toString();
            _trongLuong = _gsdetail[0].trongLuong.toString();
            _theTrang = _gsdetail[0].dtt.toString();
            _namTuoi = _gsdetail[0].namTuoi.toString();
          },
        );
      },
    );
  }

  final List<Widget> pages = [
    ConBo_page(),
    ChucNang_Page(),
    NhatKyBo_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width; //393
    double _h = MediaQuery.of(context).size.height; //856
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 44, 194, 81),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _soTai,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    // ignore: prefer_const_constructors
                    Icon(
                      Icons.production_quantity_limits,
                      size: 15,
                      color: Colors.white,
                    ),
                    Text(
                      ' Chủ hộ: ${_tenChuHo}',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: _w / 8.5,
              height: _w / 8.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/info/img_bo.jpg'),
                ),
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 44, 194, 81),
      //pages[_currentIndex],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: _w * (5 / 100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _trongLuong == 'null' ? "Ko có" : _trongLuong,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'TRỌNG LƯỢNG',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _theTrang == 'null' ? "Ko có" : _theTrang,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'THỂ TRẠNG',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _namTuoi == 'null' ? "Ko có" : _namTuoi,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'NĂM TUỔI',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: pages[_currentIndex],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Chức năng'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Nhật kí bò',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
