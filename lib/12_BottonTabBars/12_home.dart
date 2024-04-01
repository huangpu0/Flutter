import 'package:flutter/material.dart';
import 'package:flutter01/12_BottonTabBars/12_me.dart';
import 'package:flutter01/12_BottonTabBars/12_message.dart';

class MyHome12 extends StatefulWidget {
  const MyHome12({super.key});

  @override
  State<MyHome12> createState() => _MyHome12State();
}

class _MyHome12State extends State<MyHome12> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('首页1'),
        ),
        ListTile(
          title: Text('首页2'),
        ),
        ListTile(
          title: Text('首页3'),
        ),
      ],
    );
  }
}
