import 'package:flutter/material.dart';

class MyIcon extends StatefulWidget {
  final Map arguments;
  const MyIcon({super.key, required this.arguments});

  @override
  State<MyIcon> createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: const Column(
        children: [
          SizedBox(height: 20),
          Icon(
            Icons.home,
            size: 40,
            color: Colors.black,
          ),

          /// 自定义图标
          SizedBox(height: 20),
          Icon(
            ITyingFont.book,
            size: 40,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class ITyingFont {
  static const IconData book = IconData(
    0x3447,
    fontFamily: 'ityingIcon',
    matchTextDirection: true,
  );

  static const IconData weixin = IconData(
    0xe607,
    fontFamily: 'ityingIcon',
    matchTextDirection: true,
  );

  static const IconData cart = IconData(
    0xf0179,
    fontFamily: 'ityingIcon',
    matchTextDirection: true,
  );
}
