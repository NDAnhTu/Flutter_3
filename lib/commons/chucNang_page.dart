// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3/Page/conBo/chucNang_1.dart';
import 'package:flutter_3/Page/conBo/chucNang_2.dart';
import 'package:flutter_3/Page/conBo/chucNang_3.dart';
import 'package:flutter_3/Page/conBo/chucNang_4.dart';
import 'package:flutter_3/Page/conBo/chucNang_5.dart';
import 'package:flutter_3/Services/giaSucDetail.dart';
import 'package:flutter_3/commons/chucNang_container.dart';
import 'package:flutter_3/commons/myDialog.dart';
import 'package:flutter_3/model/giaSucs_Detail.dart';
import 'package:get/get.dart';

class ChucNang_Page extends StatefulWidget {
  @override
  _ChucNang_PageState createState() => _ChucNang_PageState();
}

class _ChucNang_PageState extends State<ChucNang_Page> {
  int _selectedIndex = 0;
  late List<GiaSucDetail> _gsdetail;
  String _soTai = ' ';
  String _theHe = ' ';
  String _id = ' ';
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
            _soTai = _gsdetail[0].soTai.toString();
            _theHe = _gsdetail[0].theHe.toString();
            _id = _gsdetail[0].id.toString();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: _h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  ChucNang_1(
                    soTai: _soTai,
                    theHe: _theHe,
                    id: _id,
                  ),
                );
              },
              child: Container(
                child: chucNangStyle(
                    icon: Icons.av_timer,
                    name: 'Đo thể trạng',
                    color: Colors.red),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  ChucNang_2(soTai: _soTai, theHe: _theHe),
                );
              },
              child: Container(
                child: chucNangStyle(
                    icon: Icons.hotel,
                    name: 'Điều trị bệnh',
                    color: Colors.orange),
              ),
            ),
            GestureDetector(
              onTap: () {
                _dialogBuilder(context);
              },
              child: Container(
                child: chucNangStyle(
                    icon: Icons.shopping_basket_sharp,
                    name: 'Bán thịt',
                    color: Colors.yellow),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  ChucNang_4(soTai: _soTai, theHe: _theHe),
                );
              },
              child: Container(
                child: chucNangStyle(
                    icon: Icons.favorite,
                    name: 'Kết quả phối',
                    color: Colors.green),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  ChucNang_5(soTai: _soTai, theHe: _theHe),
                );
              },
              child: Container(
                child: chucNangStyle(
                    icon: Icons.notifications,
                    name: 'Viêm vú',
                    color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lí do bán thịt'),
          content: Column(
            children: [],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Đồng ý'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
