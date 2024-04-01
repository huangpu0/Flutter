import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  final Map arguments;
  const MyText({super.key, required this.arguments});

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: Container(
        width: 200,
        height: 200,
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
        child: const Text(
          '你好,我是Flutter你好,我是Flutter你好,我是Flutter你好,我是Flutter你好,我是Flutter你好,我是Flutter',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // 溢出显示...
          style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic, // 倾斜
              letterSpacing: 3, // 字体间距
              decoration: TextDecoration.underline, // 下划线
              decorationColor: Colors.black, // 下划线颜色
              decorationStyle: TextDecorationStyle.dashed // 虚线
              ),
        ),
      ),
    );
  }
}
