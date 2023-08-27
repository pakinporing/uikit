import 'dart:async';

import 'package:flutter/material.dart';

Future<String?> ButtonPickerDialog(BuildContext context) async {
  final Completer<String?> completer = Completer<String?>();

  await showDialog<String?>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('เพิ่มปุ่มกด'),
        children: ['เพิ่มปุ่มกดแบบที่1', 'เพิ่มปุ่มกดแบบที่2', 'ลบ']
            .map((String text) {
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
