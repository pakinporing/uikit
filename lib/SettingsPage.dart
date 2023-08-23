import 'package:flutter/material.dart';

import 'Dialog/AppBarPickerDialog.dart';
import 'Dialog/ColorPickerDialog.dart';
import 'Dialog/InputPickerDialog.dart';
import 'Dialog/PicDialog.dart';
import 'Dialog/TextPickerDialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color? selelectedColor;
  String? selelectedText;
  String? selelectedPic;
  String? selelectedAppBar;
  String? addInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าตั้งค่าการแสดงผล'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, [
            selelectedColor,
            selelectedText,
            selelectedPic,
            selelectedAppBar,
            addInput
          ]),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('เปลี่ยนสีพื้นหลัง'),
            onTap: () async {
              await ColorPickerDialog(context).then((value) {
                setState(() {
                  selelectedColor = value;
                });
              });
            },
          ),
          ListTile(
            title: Text('เปลี่ยนรูปภาพ'),
            onTap: () async {
              await PicDialog(context).then((value) {
                setState(() {
                  selelectedPic = value;
                });
              });
            },
          ),
          ListTile(
            title: Text('เปลี่ยนข้อความ'),
            onTap: () async {
              await TextPickerDialog(context).then((value) {
                setState(() {
                  selelectedText = value;
                });
              });
            },
          ),
          ListTile(
            title: Text('เพิ่มInput'),
            onTap: () async {
              await InputPickerDialog(context).then((value) {
                setState(() {
                  addInput = value;
                });
              });
            },
          ),
          ListTile(
            title: Text('เปลี่ยนข้อความ AppBar'),
            onTap: () async {
              await AppBarPickerDialog(context).then((value) {
                setState(() {
                  selelectedAppBar = value;
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
