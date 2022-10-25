import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/controller_ConBo_page.dart';
import 'package:flutter_3/Services/giaSuc_sevices.dart';
import 'package:flutter_3/Services/vatSua_services.dart';
import 'package:flutter_3/model/giaSucs.dart';
import 'package:flutter_3/model/vatSuas.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListView_VatSua extends StatefulWidget {
  @override
  State<ListView_VatSua> createState() => _ListView_VatSuaState();
}

class _ListView_VatSuaState extends State<ListView_VatSua> {
  late List<VatSua> _vatsua;
  late bool _loading;
  @override
  void initState() {
    _vatsua = [];
    super.initState();
    _loading = true;
    VatSuaServices.getVatSua().then((vatsuas) {
      setState(() {
        _vatsua = vatsuas;
        _loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 18),
        height: double.infinity,
        child: _loading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 144, 227, 147),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _vatsua.length,
                itemBuilder: (BuildContext context, int index) {
                  var item_vatsuas = _vatsua[index];
                  return Item_1(context, item_vatsuas);
                },
              ),
      ),
    );
  }
}

Widget Item_1(BuildContext context, VatSua item_vatsuas) {
  String date = item_vatsuas.ngay!;
  DateTime parsedDate = new DateFormat("yyyy-MM-dd").parse(date);
  //chuyển String về dạng ngày tháng
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 25, 8),
    child: Container(
      width: 360,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromARGB(255, 16, 121, 58)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment(0, 0),
            child: Text(
              DateFormat("dd/MM/yyyy").format(parsedDate),
              //format dạng DateTime qua dạng String
              style: TextStyle(
                  color: Color.fromARGB(255, 49, 122, 51),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item_vatsuas.thucsang.toString() == "null"
                        ? "Ko vắt"
                        : item_vatsuas.thucsang.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Buổi sáng',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item_vatsuas.thucchieu.toString() == "null"
                        ? "Ko vắt"
                        : item_vatsuas.thucsang.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Buổi chiều',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item_vatsuas.tongsua.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Tổng',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
