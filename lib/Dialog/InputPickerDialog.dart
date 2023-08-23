import 'dart:async';

import 'package:flutter/material.dart';

Future<String?> InputPickerDialog(BuildContext context) async {
  final Completer<String?> completer = Completer<String?>();

  await showDialog<String?>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('เพิ่มInput'),
        children: ['เพิ่ม input', 'ลบ'].map((String text) {
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
