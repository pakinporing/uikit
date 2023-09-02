import 'dart:async';

import 'package:flutter/material.dart';

Future<Color?> ColorPickerDialog(BuildContext context) async {
  final Completer<Color?> completer = Completer<Color?>();

  await showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('เปลี่ยนสีพื้นหลัง'),
        children: [
          Colors.red,
          Colors.orange,
          Colors.green,
          Colors.blue,
          Colors.white,
        ].map((Color color) {
          return SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, color); // ส่งค่าสีกลับเมื่อเลือก
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: Colors.grey, // สีของเส้นขอบ
                  width: 2.0, // ความกว้างของเส้นขอบ
                ),
              ),
              height: 40,
            ),
          );
        }).toList(),
      );
    },
  ).then((selectedColor) {
    completer.complete(selectedColor);
  });

  return completer.future;
}




// class ColorPickerDialog extends StatefulWidget {
//   const ColorPickerDialog({super.key});

//   @override
//   State<ColorPickerDialog> createState() => _ColorPickerDialogState();
// }

// class _ColorPickerDialogState extends State<ColorPickerDialog> {
//   Color _selectedColor = Colors.red;

//   final List<Color> _colors =
//   @override
//   Widget build(BuildContext context) {

//     return
//   }
// }
//