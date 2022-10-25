import 'package:flutter/material.dart';
import 'package:flutter_3/Services/nongDan_service.dart';
import 'package:flutter_3/commons/ListView/listview_BaoBan.dart';
import 'package:flutter_3/commons/ListView/listview_HauBi.dart';
import 'package:flutter_3/commons/ListView/listview_HauBi2.dart';
import 'package:flutter_3/commons/drawer/drawerLeft.dart';
import 'package:flutter_3/commons/drawer/drawerRight.dart';
//import 'package:flutter_3/model/nongDan.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HauBi_page extends StatefulWidget {
  const HauBi_page({Key? key}) : super(key: key);

  @override
  State<HauBi_page> createState() => _HauBi_pageState();
}

class _HauBi_pageState extends State<HauBi_page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerLeft(),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Color.fromARGB(255, 174, 222, 118),
                expandedHeight: 285,
                floating: false,
                // pinned: true,
                bottom: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Đã báo bán'),
                    Tab(text: 'Chờ cạn sữa'),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.white,
                    child: SvgPicture.asset(
                      'assets/images/ban-bo.svg',
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  'Hậu bị',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    _openDrawer();
                  },
                  icon: Icon(
                    Icons.dehaze,
                    color: Colors.black,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [ListView_BaoBan(), ListView_BaoBan()],
          ),
        ),
      ),
    );
  }
}
