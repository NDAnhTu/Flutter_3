import 'package:flutter/material.dart';
import 'package:flutter_3/Page/info_page.dart';
import 'package:flutter_3/Services/nongDan_service.dart';
import 'package:flutter_3/model/nongDans.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListView_User extends StatefulWidget {
  List<NongDan> nD_1;
  ListView_User({required this.nD_1});
  @override
  State<ListView_User> createState() => _ListView_UserState();
}

class _ListView_UserState extends State<ListView_User> {
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: widget.nD_1.length,
        itemBuilder: (BuildContext context, int index) {
          var item_nongDans = widget.nD_1[index];
          return Item_1(context, item_nongDans);
        },
      ),
    );
  }
}

Widget Item_1(BuildContext context, NongDan item_info) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 1),
    child: GestureDetector(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('idchuho', item_info.id!);
        await prefs.setString('tenchuho', item_info.tenNongDan!);
        print(item_info.id);
        Get.to(Info_page(
          id: item_info.id!,
          name: item_info.tenNongDan!,
          tenXa: item_info.tenXa!,
          tenHuyen: item_info.tenHuyen!,
          soGiaSuc: item_info.soGiaSuc!,
        ));
      },
      child: Container(
        width: 360,
        height: 80,
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
            SizedBox(
              height: 70,
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item_info.tenNongDan!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${item_info.tenXa!}, Huyện ${item_info.tenHuyen!}',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.lightGreen,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item_info.maNongDan!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mã xã viên',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item_info.soGiaSuc.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Gia súc',
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
