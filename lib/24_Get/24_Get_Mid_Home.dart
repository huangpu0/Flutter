import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyHomeMid24 extends StatefulWidget {
  const MyHomeMid24({super.key});

  @override
  State<MyHomeMid24> createState() => _MyHomeMid24State();
}

class _MyHomeMid24State extends State<MyHomeMid24> {
  /// 定义为响应式变量
  final RxInt count = 0.obs;
  final RxString _userName = '章三'.obs;
  final RxList _list = ['章三', '里斯'].obs;

  /// 实例化
  var person = GetPerson();

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
          ListTile(
            title: Obx(() {
              return Text('${count.value}');
            }),
          ),
          ListTile(
            title: Obx(() {
              return Text(_userName.value);
            }),
          ),
          ListTile(
            title: Obx(() {
              return Text(person.uu_name.value);
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            count.value++;
            _userName.value = 'kkk';
            _list.add('王武');
            person.uu_name.value = 'person---kkkk';
          }),
    );
  }
}

class GetPerson {
  RxString uu_name = 'kkkk'.obs;
  RxInt uu_age = 15.obs;
}
