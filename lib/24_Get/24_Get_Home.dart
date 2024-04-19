import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome24 extends StatefulWidget {
  const MyHome24({super.key});

  @override
  State<MyHome24> createState() => _MyHome24State();
}

class _MyHome24State extends State<MyHome24> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1、原生路由接收数据
        //title: Text(widget.arguments["title"]),
        // 2、Get方式路由跳转接收数据
        title: Text(Get.arguments['title']),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(Get.arguments['data']),
          ),
          const ListTile(
            title: Text('Get路由123'),
          ),
          const ListTile(
            title: Text('Get路由321'),
          ),
        ],
      ),
    );
  }
}
