import 'package:flutter/material.dart';
import 'package:flutter_3/Page/conBo/conBo_page.dart';
import 'package:flutter_3/Services/tongDan.dart';
import 'package:flutter_3/model/tongDan.dart';
import 'package:get/get.dart';

class ListView_TongDan extends StatefulWidget {
  const ListView_TongDan({Key? key}) : super(key: key);

  @override
  State<ListView_TongDan> createState() => _ListView_TongDanState();
}

class _ListView_TongDanState extends State<ListView_TongDan> {
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

  Widget build(BuildContext context) {
    return Container(
      //height: 600,
      child: _loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Colors.lightGreen,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _tongdan.length,
              itemBuilder: (BuildContext context, int index) {
                var item_info = _tongdan[index];
                return Item_1(context, item_info);
              },
            ),
    );
  }
}

Widget Item_1(BuildContext context, TongDan item_info) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 1),
    child: GestureDetector(
      onTap: () {
        //print(item_info.id.runtimeType);
        Get.to(
          ConBo_page(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color.fromARGB(255, 31, 208, 51),
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item_info.sotai.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 10, 11, 10),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${item_info.trongluong.toString()}kg",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 61, 68, 53),
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item_info.songaysinhsan.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 187, 43, 43),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Chờ phối',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 187, 43, 43),
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${item_info.dtt.toString()}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 26, 48, 146),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Thể trạng',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 26, 48, 146),
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item_info.luasinh.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 146, 132, 8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lứa',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 146, 132, 8),
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
