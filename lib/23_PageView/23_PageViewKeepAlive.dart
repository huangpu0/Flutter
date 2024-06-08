import 'package:flutter/material.dart';
import 'package:flutter01/Tools/KeepAliveWrapper.dart';
import 'package:get/get.dart';

class MyPageViewKeepalive extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyPageViewKeepalive({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyPageViewKeepalive({super.key});

  @override
  State<MyPageViewKeepalive> createState() => _MyPageViewKeepaliveState();
}

class _MyPageViewKeepaliveState extends State<MyPageViewKeepalive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 1、原生路由接收数据
          //title: Text(widget.arguments["title"]),
          // 2、Get方式路由跳转接收数据
          title: Text(Get.arguments['title']),
        ),
        body: PageView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              /// 表示缓存页面 缓存之后 build 方法不在执行
              return KeepAliveWrapper(child: MyContainerKA(number: index));
            }));
  }
}

/// 自定义组件
class MyContainerKA extends StatefulWidget {
  final int number;
  const MyContainerKA({super.key, required this.number});

  @override
  State<MyContainerKA> createState() => _MyContainerKAState();
}

class _MyContainerKAState extends State<MyContainerKA> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('第<${widget.number}>屏'),
    );
  }

  // with AutomaticKeepAliveClientMixin
  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => true;
  /// 表示缓存页面 缓存之后 build 方法不在执行
}
