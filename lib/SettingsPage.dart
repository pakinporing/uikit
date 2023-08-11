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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าตั้งค่าการแสดงผล'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('เปลี่ยนสีพื้นหลัง'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ColorPickerDialog();
                },
              );
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
