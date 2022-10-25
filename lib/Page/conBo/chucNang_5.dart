import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class ChucNang_5 extends StatefulWidget {
  String soTai, theHe;
  ChucNang_5({
    required this.soTai,
    required this.theHe,
  });

  @override
  State<ChucNang_5> createState() => _ChucNang_5State();
}

class _ChucNang_5State extends State<ChucNang_5> {
  final items = ['Bình thường', 'Có bệnh', 'Hết bệnh'];
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'VIÊM VÚ',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/app/img_bo.jpg')),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.soTai,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.assignment_ind,
                          size: 20,
                        ),
                        Text(
                          'Thế hệ: ${widget.theHe}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Text(
                    DateFormat('dd/MM/yyyy').format(now),
                  ),
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Chi tiết khám'),
                  hintText: 'Nhập nội dung',
                  prefixIcon: Icon(Icons.confirmation_num),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'LƯU',
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  fixedSize: MaterialStateProperty.all(Size(100, 25))),
            ),
          ],
        ),
      ),
    );
  }
}
