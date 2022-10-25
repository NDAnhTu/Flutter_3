import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/controller_ConBo_page.dart';
import 'package:flutter_3/Page/conBo/conBo_page.dart';
import 'package:flutter_3/Services/giaSuc_sevices.dart';
import 'package:flutter_3/model/giaSucs.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListView_GiaSuc extends StatefulWidget {
  @override
  State<ListView_GiaSuc> createState() => _ListView_GiaSucState();
}

class _ListView_GiaSucState extends State<ListView_GiaSuc> {
  late List<GiaSuc> _giasuc;
  late bool _loading;
  @override
  void initState() {
    _giasuc = [];
    super.initState();
    _loading = true;
    GiaSucServices.getGiaSuc().then((giaSucs) {
      setState(() {
        _giasuc = giaSucs;
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
                itemCount: _giasuc.length,
                itemBuilder: (BuildContext context, int index) {
                  var item_giasuc = _giasuc[index];
                  return Item_1(context, item_giasuc, index);
                },
              ),
      ),
    );
  }
}

Widget Item_1(BuildContext context, GiaSuc item_giasuc, int index) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 1),
    child: Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt('idgiasuc', item_giasuc.id!);
              Get.to(
                Controller_ConBo_Page(),
              );
            },
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            icon: Icons.arrow_back,
            label: 'Chi tiết',
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.75,
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) {},
            backgroundColor: Colors.green,
            borderRadius: BorderRadius.circular(20),
            icon: Icons.water_drop_rounded,
            label: 'Viêm vú',
          ),
          SlidableAction(
            flex: 1,
            onPressed: (context) {},
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            icon: Icons.label_off_rounded,
            label: 'Mất thẻ',
          ),
          SlidableAction(
            flex: 1,
            onPressed: (context) {},
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(20),
            icon: Icons.delete_sweep,
            label: 'Đã bán',
          ),
        ],
      ),
      child: Container(
        width: 360,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 164, 219, 102)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
                    '${index + 1}',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 30, 32, 29),
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
                        item_giasuc.sotai!,
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
                        item_giasuc.sinhsan!,
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
              children: [
                Text(
                  item_giasuc.namtuoi.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Tuổi',
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
