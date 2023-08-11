import 'package:flutter/material.dart';

class ColorPickerDialog extends StatefulWidget {
  const ColorPickerDialog({super.key});

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  Color _selectedColor = Colors.red;
  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('เปลี่ยนสีพื้นหลัง'),
      children: _colors.map((Color color) {
        return SimpleDialogOption(
          onPressed: () {
            setState(() {
              _selectedColor = color;
            });
            Navigator.pop(context);
            print(_selectedColor);
          },
          child: Container(
            color: color,
            height: 40,
          ),
        );
      }).toList(),
    );
  }
}
