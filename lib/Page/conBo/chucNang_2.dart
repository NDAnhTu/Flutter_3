// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_3/Services/sick_services.dart';
import 'package:flutter_3/model/sick.dart';
import 'package:intl/intl.dart';

List<String> list = <String>['Bình thường', 'Có bệnh', 'Hết bệnh'];

class ChucNang_2 extends StatefulWidget {
  String soTai, theHe;
  ChucNang_2({
    required this.soTai,
    required this.theHe,
  });
  @override
  State<ChucNang_2> createState() => _ChucNang_2State();
}

class _ChucNang_2State extends State<ChucNang_2> {
  late List<Sick> _sick;
  late bool _loading;
  late Sick _selected;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Sick_List.getSickList().then(
      (sick) {
        setState(
          () {
            _loading = false;
            _sick = sick;
            _selected = _sick.first;
          },
        );
      },
    );
  }

  String dropdownValue_1 = list.first;
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'ĐIỀU TRỊ BỆNH',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                            color: Colors.green,
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
                    labelText: DateFormat('dd/MM/yyyy').format(now),
                    labelStyle: MaterialStateTextStyle.resolveWith(
                      (states) => TextStyle(color: Colors.black),
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
                child: _loading
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.green,
                          // ignore: unnecessary_new
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 144, 227, 147),
                          ),
                        ),
                      )
                    : DropdownButtonFormField(
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
                        value: _selected,
                        items: _sick.map<DropdownMenuItem<Sick>>((Sick value) {
                          return DropdownMenuItem<Sick>(
                            value: value,
                            child: Text(value.ten.toString()),
                          );
                        }).toList(),
                        onChanged: (Sick? newValue) {
                          setState(() {
                            _selected = newValue!;
                          });
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '0',
                    label: Text('Tái khám'),
                    suffixText: 'ngày',
                    prefixIcon: Icon(
                      Icons.confirmation_num,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  //enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Nội dung điều trị'),
                    prefixIcon: Icon(
                      Icons.data_usage,
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
      ),
    );
  }
}
