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
  String? input = '';

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
                if (value[4] != null) {
                  setState(() {
                    input = value[4];
                  });
                }

                print('======== $value ======');
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 1500,
            color: bgColor,
            child: Column(
              children: [
                pic == 'assets/null.png' || pic == 'assets/del.png'
                    ? Container()
                    : Image.asset(
                        pic ?? 'assets/null.png',
                        height: 300,
                      ),
                SizedBox(
                  height: 8,
                ),
                input == '' || input == 'ลบ'
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, left: 30, right: 30),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
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
      ),
    );
  }
}
