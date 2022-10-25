import 'package:flutter/material.dart';
import 'package:flutter_3/Services/viSinh_services.dart';
import 'package:flutter_3/model/viSinh.dart';
import 'package:intl/intl.dart';

class ListView_ViSinh extends StatefulWidget {
  @override
  State<ListView_ViSinh> createState() => _ListView_ViSinhState();
}

class _ListView_ViSinhState extends State<ListView_ViSinh> {
  late List<ViSinh> _visinh;
  late bool _loading;
  @override
  void initState() {
    _visinh = [];
    super.initState();
    _loading = true;
    ViSinhServices.getViSinh().then((viSinhs) {
      setState(() {
        _visinh = viSinhs;
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
                itemCount: _visinh.length,
                itemBuilder: (BuildContext context, int index) {
                  var item_visinh = _visinh[index];
                  return Item_1(context, item_visinh);
                },
              ),
      ),
    );
  }
}

Widget Item_1(BuildContext context, ViSinh item_visinh) {
  String date = item_visinh.ngay!;
  DateTime parsedDate = new DateFormat("yyyy-MM-dd").parse(date);
  //chuyển String về dạng ngày tháng
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 25, 8),
    child: Container(
      width: 360,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromARGB(255, 21, 127, 32)),
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
                    item_visinh.beo.toString(),
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
                    'Độ béo',
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
                    item_visinh.kho.toString(),
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
                    'Độ khô',
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
                    item_visinh.visinh.toString(),
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
                    'Vi sinh',
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
