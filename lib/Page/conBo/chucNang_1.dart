// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_3/Page/conBo/saveTheTrang.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChucNang_1 extends StatefulWidget {
  String soTai, theHe, id;
  ChucNang_1({required this.soTai, required this.theHe, required this.id});

  @override
  State<ChucNang_1> createState() => _ChucNang_1State();
}

class _ChucNang_1State extends State<ChucNang_1> {
  var _ngayCanController = TextEditingController();
  var _dttController = TextEditingController();
  final _trongLuongController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'ĐO THỂ TRẠNG',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/app/img_bo.jpg')),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.soTai,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.assignment_ind,
                          size: 20,
                          color: Colors.green,
                        ),
                        Text(
                          'Thế hệ: ${widget.theHe}',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: DateFormat('dd/MM/yyyy').format(now),
                  labelStyle: MaterialStateTextStyle.resolveWith(
                    (states) => TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _dttController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '3',
                  label: Text('Điểm thể trạng'),
                  prefixIcon: Icon(
                    Icons.confirmation_num,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(),
                ),
                //enabled: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _trongLuongController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Trọng lượng bò'),
                  suffixText: 'kg',
                  prefixIcon: Icon(
                    Icons.data_usage,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data();
                });
              },
              // ignore: sort_child_properties_last
              child: Text(
                'LƯU',
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  fixedSize: MaterialStateProperty.all(Size(100, 25))),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> data() async {
    final prefs = await SharedPreferences.getInstance();
    int idchuho = prefs.getInt('idchuho')!;
    String tenNongDan = prefs.getString('tenchuho')!;
    var now = DateTime.now();
    String moonLanding =
        // ignore: unnecessary_new
        (DateFormat("yyyy-MM-dd'T'17:00:00.000'Z'").format(now)).toString();
    var noi_dung = {
      "loai": 1,
      "ngay": moonLanding,
      "data": {"TL": _trongLuongController.text, "TT": _dttController.text},
      "noi_dung": _trongLuongController.text +
          "kg" +
          " và Thể trạng: " +
          _dttController.text,
      "nguoi_kham": tenNongDan,
      "nguoi_dung": {"id": idchuho}
    };
    var data = json.encode({
      "id": widget.id,
      "trong_luong": _trongLuongController.text,
      "dtt": _dttController.text,
      "data": {"TL": _trongLuongController.text, "TT": _dttController.text},
      "loai": 1,
      "ngay": now.year.toString() +
          "-" +
          now.month.toString().padLeft(2, '0') +
          "-" +
          now.day.toString().padLeft(2, '0'),
      "gio": now.hour.toString() + ":" + now.minute.toString(),
      "noi_dung": noi_dung,
      "nguoi_dung": idchuho,
      "ten_nguoi_dung": tenNongDan,
    });
    String resp;
    saveDoTheTrang(data).then((str) async {
      resp = str;
      if (resp == '1') {
        print(data);
        print('Thành công');
      } else {
        print(data);
        print('Thất bại');
        return true;
      }
    });
    return data;
  }
}
