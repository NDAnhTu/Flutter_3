import 'package:flutter/material.dart';
import 'package:flutter_3/Services/tongDan.dart';
import 'package:flutter_3/commons/ListView/listviewTongDan.dart';
import 'package:flutter_3/commons/customClipper.dart';
import 'package:flutter_3/model/Detail.dart';
import 'package:flutter_3/model/khamThai.dart';
import 'package:flutter_3/model/tongDan.dart';

class TimKiem_Page extends StatefulWidget {
  const TimKiem_Page({Key? key}) : super(key: key);

  @override
  State<TimKiem_Page> createState() => _TimKiem_PageState();
}

class _TimKiem_PageState extends State<TimKiem_Page> {
  late List<TongDan> _tongdan;
  late bool _loading;
  @override
  void initState() {
    _tongdan = [];
    super.initState();
    _loading = true;
    TongDan_List.getTongDan().then((tongdan) {
      setState(() {
        _tongdan = tongdan;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      decoration: BoxDecoration(
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(35),
                              ),
                            ),
                            //color: Colors.white,
                            child: TextField(
                              cursorColor: Colors.black,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 32.0, vertical: 14.0),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Tìm kiếm",
                                hintStyle: TextStyle(color: Colors.lightGreen),
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
                        Text(
                          _tongdan.length.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TỔNG ĐÀN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView_TongDan(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.sort_by_alpha),
        backgroundColor: Colors.green,
      ),
    );
  }
}
