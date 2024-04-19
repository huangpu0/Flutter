import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Padding布局
class MyPadding extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyPadding({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyPadding({
    super.key,
  });

  @override
  State<MyPadding> createState() => _MyPaddingState();
}

class _MyPaddingState extends State<MyPadding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 1、原生路由接收数据
          //title: Text(widget.arguments["title"]),
          // 2、Get方式路由跳转接收数据
          title: Text(Get.arguments['title']),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Text('你好Flutter'),
        ));
  }
}
