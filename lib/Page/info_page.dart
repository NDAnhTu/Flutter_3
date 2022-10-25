import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/controll_page.dart';
import 'package:flutter_3/Services/vatSua_services.dart';
import 'package:flutter_3/Services/viSinh_services.dart';
import 'package:flutter_3/commons/ListView/listView_VatSua.dart';
import 'package:flutter_3/commons/ListView/listview_GiaSuc.dart';
import 'package:flutter_3/commons/ListView/listview_ViSinh.dart';
import 'package:flutter_3/commons/ListView/listview_ViengTham.dart';
import 'package:flutter_3/model/vatSuas.dart';
import 'package:flutter_3/model/viSinh.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Info_page extends StatefulWidget {
  String name, tenXa, tenHuyen;
  int id, soGiaSuc;
  Info_page({
    required this.id,
    required this.name,
    required this.tenXa,
    required this.tenHuyen,
    required this.soGiaSuc,
  });

  @override
  State<Info_page> createState() => _Info_pageState();
}

class _Info_pageState extends State<Info_page> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  late List<ViSinh> _visinh;
  String _viSinh_0 = '0';
  late List<VatSua> _vatsua;
  String _vatsua_0 = '0';
  @override
  void initState() {
    _visinh = [];
    _vatsua = [];
    super.initState();
    ViSinhServices.getViSinh().then((viSinhs) {
      setState(() {
        _visinh = viSinhs;
        _viSinh_0 = _visinh[0].visinh.toString();
        VatSuaServices.getVatSua().then(
          (vatsuas) {
            setState(() {
              _vatsua = vatsuas;
              _vatsua_0 = _vatsua[0].tongsua.toString();
            });
          },
        );
      });
    });
  }

  final List<Widget> listview = [
    ListView_GiaSuc(),
    ListView_VatSua(),
    ListView_ViengTham(),
    ListView_ViSinh(),
    ListView_VatSua()
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.lightGreen],
            ),
          ),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.off(
              HomeScreen(),
            );
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          Icon(Icons.phone),
          SizedBox(
            width: 20,
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name),
            Text(
              '${widget.tenXa}, Huyện ${widget.tenHuyen}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.lightGreen],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.soGiaSuc.toString(),
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Con',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'GIA SÚC',
                      style: TextStyle(
                        fontSize: 16,
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
                          _vatsua_0,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Kg',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'VẮT SỮA',
                      style: TextStyle(
                        fontSize: 16,
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
                          _viSinh_0,
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'VI SINH',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          listview[_currentIndex],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: GNav(
          selectedIndex: _currentIndex,
          tabBackgroundColor: const Color.fromARGB(255, 178, 224, 126),
          padding: const EdgeInsets.all(9),
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.art_track,
              text: ' Gia Súc',
            ),
            GButton(
              icon: Icons.opacity,
              text: ' Vắt Sữa',
            ),
            GButton(
              icon: Icons.mode_edit,
              text: ' Viếng Thăm',
            ),
            GButton(
              icon: Icons.nfc,
              text: ' Vi Sinh',
            ),
            GButton(
              icon: Icons.timeline,
              text: ' Biểu Đồ',
            ),
          ],
        ),
      ),
    );
  }
}
