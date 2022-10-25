// ignore_for_file: file_names

import 'package:flutter/material.dart';

class chucNangStyle extends StatelessWidget {
  const chucNangStyle({
    Key? key,
    required this.icon,
    required this.name,
    required this.color,
  }) : super(key: key);

  final icon;
  final String name;
  final color;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: _w / 6,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
              ),
              SizedBox(
                width: _w / 13,
              ),
              Text(
                name,
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
