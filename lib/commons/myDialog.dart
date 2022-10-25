import 'package:flutter/material.dart';

class myDialog extends StatefulWidget {
  const myDialog({super.key});

  @override
  State<myDialog> createState() => _myDialogState();
}

class _myDialogState extends State<myDialog> {
  int _selectedIndex = 0;
  List<String> countries = <String>[
    'Bại liệt',
    'Viêm vú',
    'Bò già',
    'Bệnh sinh sản',
    'Đau chân móng'
  ];
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
