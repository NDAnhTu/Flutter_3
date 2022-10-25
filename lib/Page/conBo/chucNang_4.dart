import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

List<String> list = <String>['Có thai', 'Không thai'];

class ChucNang_4 extends StatefulWidget {
  String soTai, theHe;
  ChucNang_4({
    required this.soTai,
    required this.theHe,
  });

  @override
  State<ChucNang_4> createState() => _ChucNang_4State();
}

class _ChucNang_4State extends State<ChucNang_4> {
  String dropdownValue_1 = list.first;
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
          'PHỐI GIỐNG',
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
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.add_link_rounded,
                    color: Colors.green,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                value: dropdownValue_1,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue_1 = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Biểu hiện lên giống'),
                  hintText: 'Báo bằng điện thoại',
                  prefixIcon: Icon(
                    Icons.confirmation_num,
                    color: Colors.green,
                  ),
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
