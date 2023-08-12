import 'dart:async';

import 'package:flutter/material.dart';

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

Future<Color> ColorPickerDialog(
  BuildContext context,
) {
  final Completer<Color> completer = Completer<Color>();
  showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('เปลี่ยนสีพื้นหลัง'),
        children: [
          Colors.red,
          Colors.orange,
          Colors.black,
          Colors.green,
          Colors.blue
        ].map((Color color) {
          return SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
              completer.complete(color);
              print(color);
            },
            child: Container(
              color: color,
              height: 40,
            ),
          );
        }).toList(),
      );
    },
  );

  return completer.future;
}
