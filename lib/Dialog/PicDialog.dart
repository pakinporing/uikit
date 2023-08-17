import 'dart:async';

import 'package:flutter/material.dart';

// class PicDialog extends StatefulWidget {
//   const PicDialog({super.key});

//   @override
//   State<PicDialog> createState() => _PicDialogState();
// }

// class _PicDialogState extends State<PicDialog> {
//   String _selectedPic = 'assets/52525252525.jpg';
//   final List<String> _picOptions = [
//     'assets/11111.png',
//     'assets/22222.jpg',
//     'assets/33333.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       title: Text('เลือกรูปภาพ'),
//       children: _picOptions.map((String pic) {
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               _selectedPic = pic;
//             });
//             Navigator.pop(context);
//             print(_selectedPic);
//           },
//           child: ListTile(
//             leading: Image.asset(
//               pic,
//               height: 100,
//               width: 100,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

Future<String?> PicDialog(BuildContext context) async {
  final Completer<String?> completer = Completer<String?>();

  await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('เปลี่ยนรูปภาพ'),
        children: [
          'assets/11111.png',
          'assets/22222.jpg',
          'assets/33333.png',
          'assets/del.png'
        ].map((String pic) {
          return SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
              completer.complete(pic);
              print(pic);
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
    },
  );

  return completer.future;
}
