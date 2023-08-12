import 'package:flutter/material.dart';

import 'Dialog/ColorPickerDialog.dart';
import 'Dialog/PicDialog.dart';
import 'Dialog/TextPickerDialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color? _selelectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าตั้งค่าการแสดงผล'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, _selelectedColor),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('เปลี่ยนสีพื้นหลัง'),
            onTap: () async {
              await ColorPickerDialog(context).then((value) {
                setState(() {
                  _selelectedColor = value;
                });
              });
            },
          ),
          ListTile(
            title: Text('เปลี่ยนรูปภาพ'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return PicDialog();
                },
              );
            },
          ),
          ListTile(
            title: Text('เปลี่ยนข้อความ'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TextPickerDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
