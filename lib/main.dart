import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SettingsPage(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Color bgColor = _selectedColor;
  // String text1 = _selectedText;
  // String pic = _selectedPic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าแสดงผล'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          // color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/52525252525.jpg'),
              Text(
                'text1',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class TextPickerDialog extends StatefulWidget {
  const TextPickerDialog({super.key});

  @override
  State<TextPickerDialog> createState() => _TextPickerDialogState();
}

class _TextPickerDialogState extends State<TextPickerDialog> {
  String _selectedText = 'ข้อความตัวอย่างจากอันเก่า';
  final List<String> _textOptions = [
    'ขอบคุณ',
    'ขอโทษ',
    'สวัสดี',
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

class PicDialog extends StatefulWidget {
  const PicDialog({super.key});

  @override
  State<PicDialog> createState() => _PicDialogState();
}

class _PicDialogState extends State<PicDialog> {
  String _selectedPic = 'assets/52525252525.jpg';
  final List<String> _picOptions = [
    'assets/11111.png',
    'assets/22222.jpg',
    'assets/33333.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('เลือกรูปภาพ'),
      children: _picOptions.map((String pic) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedPic = pic;
            });
            Navigator.pop(context);
            print(_selectedPic);
          },
          child: ListTile(
            leading: Image.asset(
              pic,
              height: 100,
              width: 100,
            ),
          ),
        );
      }).toList(),
    );
  }
}

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
