import 'package:flutter/material.dart';
import 'package:flutter01/03_Font.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
