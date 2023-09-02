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
  String? button = '';

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
                if (value[5] != null) {
                  setState(() {
                    button = value[5];
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
                text1 == '' || text1 == 'ลบ'
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          text1 ?? '',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
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
                const SizedBox(
                  height: 30,
                ),
                button == '' || button == 'ลบ'
                    ? Container()
                    : button == 'เพิ่มปุ่มกดแบบที่1'
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(16),
                              backgroundColor: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                            ),
                            child: Text('สี่เหลี่ยม'),
                          )
                        : button == 'เพิ่มปุ่มกดแบบที่2'
                            ? InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'วงกลม',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
