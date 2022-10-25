import 'package:flutter/material.dart';
import 'package:flutter_3/commons/ListView/listView_KhamThai.dart';
import 'package:flutter_3/commons/ListView/listview_BaoDe.dart';
import 'package:flutter_3/commons/drawer/drawerLeft.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class SinhSan_page extends StatefulWidget {
  const SinhSan_page({Key? key}) : super(key: key);

  @override
  State<SinhSan_page> createState() => _SinhSan_pageState();
}

class _SinhSan_pageState extends State<SinhSan_page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      // ignore: prefer_const_constructors
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  int _currentindex = 1;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerLeft(),
        //endDrawer: DrawerRight(),
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
                  //pinned: true,
                  // ignore: prefer_const_constructors
                  bottom: TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Khám thai'),
                      Tab(text: 'Báo đẻ'),
                    ],
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.white,
                      child: SvgPicture.asset(
                        'assets/images/sinh-san.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    'Sinh sản',
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView_KhamThai(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView_BaoDe(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
