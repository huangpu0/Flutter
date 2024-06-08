import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimatedList extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyAnimatedList({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyAnimatedList({
    super.key,
  });

  @override
  State<MyAnimatedList> createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  // ignore: non_constant_identifier_names
  final al_globalKey = GlobalKey<AnimatedListState>();
  bool flag = true;
  List<String> list = [
    '第1条数据',
    '第2条数据',
    '第3条数据',
    '第4条数据',
    '第5条数据',
  ];
  Widget _buildItem(index) {
    return ListTile(
      title: Text(list[index]),
      trailing: IconButton(
          onPressed: () {
            /// 执行删除
            _deleteItem(index);
          },
          icon: const Icon(Icons.delete)),
    );
  }

  /// 删除item
  _deleteItem(index) {
    if (flag == true) {
      flag = false;
      al_globalKey.currentState?.removeItem(index, (context, animation) {
        var removeItem = _buildItem(index);
        list.removeAt(index);
        return FadeTransition(
          opacity: animation,

          /// 要删除的执行动画元素
          child: removeItem,
        );
      });

      /// 解决快速删除的Bug
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1、原生路由接收数据
        //title: Text(widget.arguments["title"]),
        // 2、Get方式路由跳转接收数据
        title: Text(Get.arguments['title']),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add('我是新增数据');
            al_globalKey.currentState?.insertItem(list.length - 1);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: al_globalKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animated) {
          return FadeTransition(
            opacity: animated,
            child: _buildItem(index),
          );
        },
      ),
    );
  }
}
