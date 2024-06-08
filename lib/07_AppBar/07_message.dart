import 'package:flutter/material.dart';

class MyMessage12 extends StatefulWidget {
  const MyMessage12({super.key});

  @override
  State<MyMessage12> createState() => _MyMessage12State();
}

class _MyMessage12State extends State<MyMessage12> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('消息1'),
        ),
        ListTile(
          title: Text('消息2'),
        ),
        ListTile(
          title: Text('消息3'),
        ),
      ],
    );
  }
}
