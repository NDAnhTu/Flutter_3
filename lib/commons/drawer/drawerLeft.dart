import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/login_controller.dart';
import 'package:flutter_3/Page/login_page.dart';
import 'package:get/get.dart';

class DrawerLeft extends StatefulWidget {
  const DrawerLeft({Key? key}) : super(key: key);

  @override
  State<DrawerLeft> createState() => _DrawerLeftState();
}

class _DrawerLeftState extends State<DrawerLeft> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image:
                          ExactAssetImage('assets/images/app/background_2.png'),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.network(
                                Get.put(LoginController())
                                        .googleAccount
                                        .value
                                        ?.photoUrl ??
                                    'Không có ảnh')
                            .image,
                        radius: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HTX EVERGROWTH',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              Get.put(LoginController())
                                      .googleAccount
                                      .value
                                      ?.displayName ??
                                  'Không có tên',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      child: ListTile(
                        leading: new Icon(Icons.power_settings_new,
                            color: Colors.green),
                        title: Text('ĐĂNG XUẤT'),
                        onTap: () {
                          Get.put(LoginController()).logout();
                          Get.off(LoginScreen());
                        },
                      ),
                    ),
                    const InkWell(
                      child: ListTile(
                        leading: Icon(Icons.spa, color: Colors.green),
                        title: Text('Hậu Bị'),
                        trailing: Text(
                          "2.340",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const InkWell(
                      child: ListTile(
                        leading: Icon(Icons.invert_colors, color: Colors.green),
                        title: Text('Hậu sản'),
                        trailing: Text(
                          "859",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const InkWell(
                      child: ListTile(
                        leading:
                            Icon(Icons.local_hospital, color: Colors.green),
                        title: Text('Đã Phối'),
                        trailing: Text(
                          "1.200",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const InkWell(
                      child: ListTile(
                        leading: Icon(Icons.feedback, color: Colors.green),
                        title: Text('Mang Thai'),
                        trailing: Text(
                          "980",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const InkWell(
                      child: ListTile(
                        leading: Icon(Icons.add_to_photos, color: Colors.green),
                        title: Text('Nái Khô'),
                        trailing: Text(
                          "1.890",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                NhomBoContent(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NhomBoContent extends StatefulWidget {
  const NhomBoContent({Key? key}) : super(key: key);

  @override
  State<NhomBoContent> createState() => _NhomBoContentState();
}

class _NhomBoContentState extends State<NhomBoContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
        ),
      ), // This align moves the children to the bottom
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: new GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            new InkWell(
              child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(), //
                child: new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new SizedBox(
                        height: 12,
                      ),
                      new Text(
                        "TỔNG ĐÀN",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      new SizedBox(
                        height: 8,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            '2.450'.toString(),
                            style: new TextStyle(
                                fontSize: 36.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          new SizedBox(
                            width: 5.0,
                          ),
                          new Column(
                            children: <Widget>[
                              new SizedBox(
                                height: 15.0,
                              ),
                              new Text(
                                'CON',
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                // Navigator.push( context, MaterialPageRoute(builder: (context) => BoThitPage(url:this.url, currentUser: this.currentUser,),),);
              },
            ),
            new InkWell(
              child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                child: new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new SizedBox(
                        height: 12,
                      ),
                      new Text(
                        "SỐ NÔNG HỘ",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      new SizedBox(
                        height: 8,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            '1.450'.toString(),
                            style: new TextStyle(
                                fontSize: 36.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          new SizedBox(
                            width: 5.0,
                          ),
                          new Column(
                            children: <Widget>[
                              new SizedBox(
                                height: 15.0,
                              ),
                              new Text(
                                'HỘ',
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                // Navigator.push( context, MaterialPageRoute(builder: (context) => BoSinhSanPage(url:this.url, currentUser: this.currentUser,),),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
