// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/controller_ConBo_page.dart';
import 'package:flutter_3/Services/baoBan.dart';
import 'package:flutter_3/Services/baoDe.dart';
import 'package:flutter_3/model/khamThai.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListView_BaoBan extends StatefulWidget {
  const ListView_BaoBan({Key? key}) : super(key: key);

  @override
  State<ListView_BaoBan> createState() => _ListView_BaoBanState();
}

class _ListView_BaoBanState extends State<ListView_BaoBan> {
  late List<KhamThai> _info;
  late bool _loading;
  @override
  void initState() {
    _info = [];
    super.initState();
    _loading = true;
    CanSuaServices.getCanSua().then((info) {
      setState(() {
        _info = info;
        _loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
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
              itemCount: _info.length,
              itemBuilder: (BuildContext context, int index) {
                var item_info = _info[index];
                return Item_1(context, item_info);
              },
            ),
    );
  }
}

Widget Item_1(BuildContext context, KhamThai item_info) {
  double _w = MediaQuery.of(context).size.width;
  double _h = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 1),
    child: GestureDetector(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('idgiasuc');
        await prefs.setInt('idgiasuc', item_info.giasucid!);
        Get.to(
          Controller_ConBo_Page(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Container(
          // width: _w / 0.8,
          height: _w / 6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: Colors.blue,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: _w / 10,
                width: _w / 10,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/app/img_bo.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: _w / 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        item_info.tennongdan!,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _h / 100,
                    ),
                    Container(
                      child: Text(
                        item_info.diachi.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      item_info.sotai!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text("${item_info.sauphoi.toString()} ngày"),
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
