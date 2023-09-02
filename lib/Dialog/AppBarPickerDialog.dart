import 'dart:async';

import 'package:flutter/material.dart';

Future<String?> AppBarPickerDialog(BuildContext context) async {
  final Completer<String?> completer = Completer<String?>();

  await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('เปลี่ยนข้อความ AppBar'),
        children:
            ['รายการ', 'ตั้งค่า', 'เมนู', 'ลาก่อน', 'ลบ'].map((String text) {
          return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                completer.complete(text);
                print(text);
              },
              child: Text(text));
        }).toList(),
      );
    },
  );

  return completer.future;
}

//
