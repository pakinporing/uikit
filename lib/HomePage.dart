import 'package:flutter/material.dart';

import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

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
