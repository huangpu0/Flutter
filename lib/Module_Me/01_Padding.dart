import 'package:flutter/material.dart';

// Padding布局
class MyPadding extends StatefulWidget {
  final Map arguments;
  const MyPadding({super.key, required this.arguments});

  @override
  State<MyPadding> createState() => _MyPaddingState();
}

class _MyPaddingState extends State<MyPadding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.arguments["title"]),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Text('你好Flutter'),
        ));
  }
}
