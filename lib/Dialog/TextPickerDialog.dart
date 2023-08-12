import 'package:flutter/material.dart';

class TextPickerDialog extends StatefulWidget {
  const TextPickerDialog({super.key});

  @override
  State<TextPickerDialog> createState() => _TextPickerDialogState();
}

class _TextPickerDialogState extends State<TextPickerDialog> {
  String _selectedText = 'ข้อความตัวอย่าง';
  final List<String> _textOptions = [
    'ขอบคุณ',
    'ขอโทษ',
    'สวัสดี',
    'ลาก่อน',
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('เปลี่ยนข้อความ'),
      children: _textOptions.map((String text) {
        return SimpleDialogOption(
          onPressed: () {
            setState(() {
              _selectedText = text;
            });
            Navigator.pop(context);
            print(_selectedText);
          },
          child: Text(text),
        );
      }).toList(),
    );
  }
}
