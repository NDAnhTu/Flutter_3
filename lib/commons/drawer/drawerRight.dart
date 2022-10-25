import 'package:flutter/material.dart';
import 'package:flutter_3/Controller/login_controller.dart';
import 'package:flutter_3/Page/login_page.dart';
import 'package:get/get.dart';

class DrawerRight extends StatefulWidget {
  const DrawerRight({Key? key}) : super(key: key);

  @override
  State<DrawerRight> createState() => _DrawerRightState();
}

class _DrawerRightState extends State<DrawerRight> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/app/background_2.png'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: Image.network(Get.put(LoginController())
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
            InkWell(
              child: ListTile(
                leading: Icon(Icons.power_settings_new, color: Colors.green),
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
                leading: Icon(Icons.local_hospital, color: Colors.green),
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
      ),
    );
  }
}
