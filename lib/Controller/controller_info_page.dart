// import 'package:flutter/material.dart';
// import 'package:flutter_3/Page/infoPage/bieuDo.dart';
// import 'package:flutter_3/Page/infoPage/giaSuc.dart';
// import 'package:flutter_3/Page/infoPage/viSinh.dart';
// import 'package:flutter_3/Page/infoPage/viengTham.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class Controller_Info_Page extends StatefulWidget {
//   var name, tenXa, tenHuyen, id, soGiaSuc;
//   Controller_Info_Page({
//     required this.id,
//     required this.name,
//     required this.tenXa,
//     required this.tenHuyen,
//     required this.soGiaSuc,
//   });

//   @override
//   State<Controller_Info_Page> createState() => _Controller_Info_PageState();
// }

// class _Controller_Info_PageState extends State<Controller_Info_Page> {
//   int _currentIndex = 0;

//   final List<Widget> screens = [
//     // Info_page(
//     //     id: widget.id,
//     //     name: widget.name,
//     //     tenXa: widget.tenXa,
//     //     tenHuyen: widget.tenHuyen,
//     //     soGiaSuc: widget.soGiaSuc),
//     VatSua_Page(),
//     ViengTham_Page(),
//     ViSinh_Page(),
//     BieuDo_Page(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final orientation = MediaQuery.of(context).orientation;
//     return Scaffold(
//       body: screens[_currentIndex],
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
//         child: GNav(
//           selectedIndex: _currentIndex,
//           tabBackgroundColor: const Color.fromARGB(255, 178, 224, 126),
//           padding: const EdgeInsets.all(9),
//           onTabChange: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           tabs: const [
//             GButton(
//               icon: Icons.art_track,
//               text: ' Gia Súc',
//             ),
//             GButton(
//               icon: Icons.opacity,
//               text: ' Vắt Sữa',
//             ),
//             GButton(
//               icon: Icons.mode_edit,
//               text: ' Viếng Thăm',
//             ),
//             GButton(
//               icon: Icons.nfc,
//               text: ' Vi Sinh',
//             ),
//             GButton(
//               icon: Icons.timeline,
//               text: ' Biểu Đồ',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
