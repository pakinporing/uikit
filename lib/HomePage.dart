import 'package:flutter/material.dart';

import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? bgColor;
  String? text1 = '';
  String? appBar = '';
  String? pic = 'assets/null.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar == 'ลบ' ? Container() : Text(appBar ?? ''),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              ).then((value) {
                if (value[0] != null) {
                  setState(() {
                    bgColor = value[0];
                  });
                }
                if (value[1] != null) {
                  setState(() {
                    text1 = value[1];
                  });
                }
                if (value[2] != null) {
                  setState(() {
                    pic = value[2];
                  });
                }
                if (value[3] != null) {
                  setState(() {
                    appBar = value[3];
                  });
                }

                print('======== $value ======');
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: bgColor,
          child: Column(
            children: [
              pic == 'assets/null.png' || pic == 'assets/del.png'
                  ? Container()
                  : Image.asset(
                      pic ?? 'assets/null.png',
                      height: 300,
                    ),
              text1 == '' || text1 == 'ลบ'
                  ? Container()
                  : Text(
                      text1 ?? '',
                      style: TextStyle(fontSize: 24),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
