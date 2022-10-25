import 'package:flutter/material.dart';
import 'package:flutter_3/Services/nongDan_service.dart';
import 'package:flutter_3/commons/ListView/listview.dart';
import 'package:flutter_3/commons/customClipper.dart';
import 'package:flutter_3/commons/drawer/drawerLeft.dart';
import 'package:flutter_3/commons/drawer/drawerRight.dart';
import 'package:flutter_3/model/nongDans.dart';

class XaVien_Page extends StatefulWidget {
  const XaVien_Page({Key? key}) : super(key: key);

  @override
  State<XaVien_Page> createState() => _XaVien_PageState();
}

class _XaVien_PageState extends State<XaVien_Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  late List<NongDan> _nongDans;
  @override
  void initState() {
    _nongDans = [];
    super.initState();
    NongDanServices.getNongDan().then((nongDans) {
      setState(() {
        _nongDans = nongDans;
      });
    });
  }

  void _runFilter(String enteredKeyword) {
    List<NongDan> results = [];
    if (enteredKeyword.isEmpty) {
      results = _nongDans;
    } else {
      results = _nongDans
          .where((user) => user.tenNongDan!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _nongDans = results;
      print(_nongDans[0].id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerLeft(),
      endDrawer: const DrawerRight(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green, Colors.lightGreen],
                        ),
                      ),
                      //color: Colors.green,
                      height: 240,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.lightGreen],
                      ),
                    ),
                    //color: Colors.green,
                    height: 230,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _openDrawer();
                              });
                            },
                            child: Icon(
                              Icons.dehaze,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              //color: Colors.white,
                              child: TextField(
                                onChanged: (value) => _runFilter(value),
                                cursorColor: Colors.black,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 14.0),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Tìm kiếm",
                                  hintStyle:
                                      TextStyle(color: Colors.lightGreen),
                                  suffixIcon: Material(
                                    elevation: 1,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        _nongDans.length.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'SỐ XÃ VIÊN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _nongDans.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Container(
                      height: 600,
                      child: ListView_User(
                        nD_1: _nongDans,
                      ),
                    ),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}
