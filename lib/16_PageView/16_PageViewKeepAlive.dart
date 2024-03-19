// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter01/Tools/KeepAliveWrapper.dart';

class MyPageViewKeepalive extends StatefulWidget {
  final Map arguments;
  const MyPageViewKeepalive({super.key, required this.arguments});

  @override
  State<MyPageViewKeepalive> createState() => _MyPageViewKeepaliveState();
}

class _MyPageViewKeepaliveState extends State<MyPageViewKeepalive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: unnecessary_string_interpolations
          title: Text('${widget.arguments["title"].toString()}'),
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
