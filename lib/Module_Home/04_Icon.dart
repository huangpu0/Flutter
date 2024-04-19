import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyIcon extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyIcon({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyIcon({
    super.key,
  });

  @override
  State<MyIcon> createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1、原生路由接收数据
        //title: Text(widget.arguments["title"]),
        // 2、Get方式路由跳转接收数据
        title: Text(Get.arguments['title']),
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
