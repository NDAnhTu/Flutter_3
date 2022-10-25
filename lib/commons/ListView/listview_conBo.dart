import 'package:flutter/material.dart';
import 'package:flutter_3/Page/info_page.dart';
import 'package:flutter_3/Services/giaSuc_sevices.dart';
import 'package:flutter_3/model/Detail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ListView_ConBo extends StatefulWidget {
  const ListView_ConBo({Key? key}) : super(key: key);

  @override
  State<ListView_ConBo> createState() => _ListView_ConBoState();
}

class _ListView_ConBoState extends State<ListView_ConBo> {
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
  // var myId = int.parse(item_info.id);
  // assert(myId is int);
  // print(myId); // 12345  String to Int
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 1),
    child: GestureDetector(
      // onTap: () {
      //   Get.to(
      //     Info_page(
      //       name: item_info.name,
      //       address: item_info.address,
      //       id: item_info.id,
      //       mangthai: item_info.mangthai,
      //       vatsua: item_info.vatsua,
      //       visinh: item_info.visinh,
      //     ),
      //   );
      // },
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.blue,
              icon: Icons.arrow_back,
              label: 'Chi tiết',
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.75,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) {},
              backgroundColor: Colors.green,
              icon: Icons.water_drop_rounded,
              label: 'Viêm vú',
            ),
            SlidableAction(
              flex: 1,
              onPressed: (context) {},
              backgroundColor: Colors.blue,
              icon: Icons.label_off_rounded,
              label: 'Mất thẻ',
            ),
            SlidableAction(
              flex: 1,
              onPressed: (context) {},
              backgroundColor: Colors.red,
              icon: Icons.delete_sweep,
              label: 'Đã bán',
            ),
          ],
        ),
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
                      style: TextStyle(color: Colors.white),
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
                          item_info.address,
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
                          item_info.name,
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
                    item_info.haubi.toString(),
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
    ),
  );
}
