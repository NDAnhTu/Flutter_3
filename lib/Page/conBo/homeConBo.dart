// import 'package:flutter/material.dart';
// import 'package:flutter_3/model/giaSucs_Detail.dart';

// class conBoDetail extends StatefulWidget {
//   const conBoDetail({
//     Key? key,
//     required bool loading,
//     required List<GiaSucDetail> gsdetail,
//   })  : _loading = loading,
//         _gsdetail = gsdetail,
//         super(key: key);
//   final bool _loading;
//   final List<GiaSucDetail> _gsdetail;

//   @override
//   State<conBoDetail> createState() => _conBoDetailState();
// }

// class _conBoDetailState extends State<conBoDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
//       child: Container(
//         height: 600,
//         child: widget._loading
//             ? Center(
//                 child: CircularProgressIndicator(
//                   backgroundColor: Colors.green,
//                   valueColor: new AlwaysStoppedAnimation<Color>(
//                     Color.fromARGB(255, 144, 227, 147),
//                   ),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: widget._gsdetail.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var item_info = widget._gsdetail[0];
//                   return Item_1(context, item_info);
//                 },
//               ),
//       ),
//     );
//   }
// }

// Widget Item_1(BuildContext context, GiaSucDetail item_info) {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Column(
//         children: [
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(bottom: 5),
//                         width: 55,
//                         height: 55,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image:
//                                   AssetImage('assets/images/info/img_bo.jpg')),
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             'SINH SẢN',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.donut_large,
//                                 size: 20,
//                                 color: Colors.green,
//                               ),
//                               Text(
//                                 ' ${item_info.sinhSan}',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontStyle: FontStyle.italic,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             item_info.theHe,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 25,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             'THẾ HỆ',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 item_info.sauSinh.toString(),
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Text(
//                                 ' ngày',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             'SAU SINH',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 item_info.soNgaySinhSan.toString(),
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Text(
//                                 ' ngày',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w200,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             'ĐÃ PHỐI',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             height: 1,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 5),
//                       width: 55,
//                       height: 55,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('assets/images/info/img_bo.jpg')),
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'VẮT SỮA',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.opacity,
//                               size: 20,
//                               color: Colors.green,
//                             ),
//                             Text(
//                               ' ${item_info.tinhTrangChoSua}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.italic,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           item_info.tuanVatSua.toString(),
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           'TUẦN',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               item_info.soNgayVatSua.toString(),
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               'ngày',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           'NGÀY VẮT',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               item_info.tbSua == null
//                                   ? '0'
//                                   : item_info.tbSua.toString(),
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               ' kg',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w200,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           'TB SỮA',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             height: 1,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 5),
//                       width: 55,
//                       height: 55,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('assets/images/info/img_bo.jpg')),
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'LỨA SINH',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.child_friendly,
//                               size: 20,
//                               color: Colors.green,
//                             ),
//                             Text(
//                               ' ${item_info.soLanSinhCon} lứa',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.italic,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           item_info.soLanPhoi.toString(),
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           'LẦN PHỐI',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               item_info.soLanSayThai.toString(),
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               'lần',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           'SẢY THAI',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               item_info.chuKiSinhSan == null
//                                   ? '0'
//                                   : item_info.chuKiSinhSan.toString(),
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               ' tháng',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w200,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           'CHU KÌ SINH',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             height: 1,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(bottom: 5),
//                     width: 55,
//                     height: 55,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/info/img_bo.jpg')),
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'NGUỒN GỐC',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       Row(
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           Icon(
//                             Icons.group,
//                             size: 20,
//                             color: Colors.green,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                     width: 350,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.assignment_ind_rounded,
//                               color: Colors.green,
//                               size: 50,
//                             ),
//                             SizedBox(
//                               width: 200,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item_info.soTaiMe.toString() == 'null'
//                                         ? 'Không có'
//                                         : item_info.soTaiMe.toString(),
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.green,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'MẸ',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           Icons.arrow_circle_right_outlined,
//                           color: Colors.grey,
//                           size: 20,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     width: 350,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.adjust,
//                               color: Colors.green,
//                               size: 50,
//                             ),
//                             SizedBox(
//                               width: 200,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item_info.tinhCha.toString() == 'null'
//                                         ? 'Không có'
//                                         : item_info.soTaiMe.toString(),
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.green,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     'TINH CHA',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           Icons.arrow_circle_right_outlined,
//                           color: Colors.grey,
//                           size: 20,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     width: 350,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.maps_home_work_outlined,
//                               color: Colors.green,
//                               size: 50,
//                             ),
//                             SizedBox(
//                               width: 200,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item_info.tenNongDan,
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.green,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     item_info.diaChi,
//                                     overflow: TextOverflow.visible,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Icon(
//                           Icons.arrow_circle_right_outlined,
//                           color: Colors.grey,
//                           size: 20,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Container(
//             height: 1,
//             color: Colors.grey,
//           ),
//         ],
//       ),
//     ),
//   );
// }
