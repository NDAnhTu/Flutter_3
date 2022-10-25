import 'package:flutter/material.dart';
import 'package:flutter_3/Page/info_page.dart';
import 'package:flutter_3/Services/giaSuc_sevices.dart';
import 'package:flutter_3/model/Detail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ListView_HauBi_2 extends StatefulWidget {
  const ListView_HauBi_2({Key? key}) : super(key: key);

  @override
  State<ListView_HauBi_2> createState() => _ListView_HauBi_2State();
}

class _ListView_HauBi_2State extends State<ListView_HauBi_2> {
  late List<Detail> _info;
  late bool _loading;
  @override
  // void initState() {
  //   _info = [];
  //   super.initState();
  //   _loading = true;
  //   Services_2.getDetail().then((info) {
  //     setState(() {
  //       _info = info;
  //       _loading = false;
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      height: 600,
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
              itemCount: _info.length,
              itemBuilder: (BuildContext context, int index) {
                var item_info = _info[index];
                return Item_1(context, item_info);
              },
            ),
    );
  }
}

Widget Item_1(BuildContext context, Detail item_info) {
  var myHauBi = int.parse(item_info.haubi.toString());
  assert(myHauBi is int);
  var myMangThai = int.parse(item_info.mangthai.toString());
  assert(myMangThai is int);

  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 1),
    child: Container(
      width: 360,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment(0, 0),
                width: 40,
                height: 40,
                child: Text(
                  item_info.id,
                  style: TextStyle(
                      color: Color.fromARGB(255, 14, 14, 14),
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 223, 234, 75),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              SizedBox(
                height: 70,
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item_info.name,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      item_info.address,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${myMangThai + myHauBi} USD',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '14/01/2001',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
