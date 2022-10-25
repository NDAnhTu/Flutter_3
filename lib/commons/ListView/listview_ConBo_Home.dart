// import 'package:flutter/material.dart';
// import 'package:flutter_3/Page/info_page.dart';
// import 'package:flutter_3/Services/giaSucDetail.dart';
// import 'package:flutter_3/Services/giaSuc_sevices.dart';
// import 'package:flutter_3/model/Detail.dart';
// import 'package:flutter_3/model/giaSucs.dart';
// import 'package:flutter_3/model/giaSucs_Detail.dart';
// import 'package:get/get.dart';

// class ListView_ConBo_Home extends StatefulWidget {
//   const ListView_ConBo_Home({Key? key}) : super(key: key);

//   @override
//   State<ListView_ConBo_Home> createState() => _ListView_ConBo_HomeState();
// }

// class _ListView_ConBo_HomeState extends State<ListView_ConBo_Home> {
//   late List<GiaSucDetail> _info;
//   late bool _loading;
//   @override
//   void initState() {
//     _info = [];
//     super.initState();
//     _loading = true;
//     GiaSucDetailServices.getGiaSucDetail().then((gsdetail) {
//       setState(() {
//         _info = gsdetail;
//         _loading = false;
//       });
//     });
//   }

//   Widget build(BuildContext context) {
//     return Container(
//       height: 600,
//       child: _loading
//           ? Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.green,
//                 valueColor: new AlwaysStoppedAnimation<Color>(
//                   Color.fromARGB(255, 144, 227, 147),
//                 ),
//               ),
//             )
//           : ListView.builder(
//               itemCount: _info.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var item_info = _info[index];
//                 return Item_1(context, item_info);
//               },
//             ),
//     );
//   }
// }

// Widget Item_1(BuildContext context, GiaSucDetail item_info) {
//   // var myId = int.parse(item_info.id);
//   // assert(myId is int);
//   //print(myId); // 12345  String to Int
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
//     child: GestureDetector(
//       onTap: () {
//         //print(item_info.id.runtimeType);
//         // Get.to(
//         //   Info_page(
//         //     name: item_info.name,
//         //     address: item_info.address,
//         //     id: item_info.id,
//         //     mangthai: item_info.mangthai,
//         //     vatsua: item_info.vatsua,
//         //     visinh: item_info.visinh,
//         //   ),
//         // );
//       },
//       child: Container(
//         width: 360,
//         height: 70,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.grey,
//           ),
//           borderRadius: BorderRadius.circular(3),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 5),
//               width: 55,
//               height: 55,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/hb_cho_phoi.png')),
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(
//               width: 150,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     item_info.trongLuong.toString(),
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   // Text(
//                   //   item_info.address,
//                   //   style: TextStyle(
//                   //       fontSize: 12,
//                   //       color: Colors.black,
//                   //       fontStyle: FontStyle.italic),
//                   // ),
//                 ],
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Text(
//                 //   item_info.maxavien,
//                 //   style: TextStyle(
//                 //     fontSize: 20,
//                 //     color: Colors.black,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//                 Text(
//                   'Mã xã viên',
//                   style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                       fontStyle: FontStyle.italic),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
