import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyText extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyText({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyText({
    super.key,
  });

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1、原生路由接收数据
        //title: Text(widget.arguments["title"]),
        // 2、Get方式路由跳转接收数据
        title: Text(Get.arguments['title']),
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
