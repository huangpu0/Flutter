import 'package:flutter/material.dart';
import 'package:flutter01/Module_Message/MessagePage.dart';

class MyMe12 extends StatefulWidget {
  const MyMe12({super.key});

  @override
  State<MyMe12> createState() => _MyMe12State();
}

class _MyMe12State extends State<MyMe12> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('我的1'),
        ),
        ListTile(
          title: Text('我的2'),
        ),
        ListTile(
          title: Text('我的3'),
        ),
      ],
    );
  }
}
