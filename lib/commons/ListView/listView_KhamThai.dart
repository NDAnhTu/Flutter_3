import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/controller_ConBo_page.dart';
import 'package:flutter_3/Services/khamThai.dart';
import 'package:flutter_3/model/khamThai.dart';
import 'package:get/get.dart';

class ListView_KhamThai extends StatefulWidget {
  const ListView_KhamThai({Key? key}) : super(key: key);

  @override
  State<ListView_KhamThai> createState() => _ListView_KhamThaiState();
}

class _ListView_KhamThaiState extends State<ListView_KhamThai> {
  late List<KhamThai> _khamthai;
  late bool _loading;
  @override
  void initState() {
    _khamthai = [];
    super.initState();
    _loading = true;
    KhamThaiServices.getKhamThai().then((kt) {
      setState(() {
        _khamthai = kt;
        _loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Container(
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
              itemCount: _khamthai.length,
              itemBuilder: (BuildContext context, int index) {
                var item_khamthai = _khamthai[index];
                return Item_1(context, item_khamthai, index);
              },
            ),
    );
  }
}

Widget Item_1(BuildContext context, KhamThai item_khamthai, index) {
  double _w = MediaQuery.of(context).size.width;
  double _h = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 1),
    child: GestureDetector(
      onTap: () {
        Get.to(Controller_ConBo_Page());
      },
      child: Container(
        width: _w / 1,
        height: _h / 12,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment(0, 0),
              width: _w / 10,
              height: _w / 10,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 33, 124, 15),
              ),
            ),
            SizedBox(
              width: _w / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item_khamthai.tennongdan!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: _w / 60,
                  ),
                  Text(
                    "Lần phối ${item_khamthai.lanphoi.toString()}",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item_khamthai.sotai.toString(),
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sau phối ${item_khamthai.sauphoi.toString()} ngày",
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
    ),
  );
}
