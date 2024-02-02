import 'package:flutter/material.dart';

class MyStack0 extends StatelessWidget {
  const MyStack0({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      color: Colors.red,
      child: Stack(
        // 相对外部容器进行定位、没有外部容器、相对于屏幕定位
        children: [
          Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              )),
          const Text('你好Flutter'),
        ],
      ),
    );
  }
}

class MyStack1 extends StatelessWidget {
  const MyStack1({super.key});

  List<Widget> initListData() {
    List<Widget> tmpList = [];
    for (var i = 0; i < 20; i++) {
      tmpList.add(ListTile(
        title: Text('列表--$i----'),
      ));
    }
    return tmpList;
  }

  @override
  Widget build(BuildContext context) {
    /// 获取设备的宽和高度
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 50),
          children: initListData(),
        ),
        Positioned(
          left: 0,
          top: 0,
          width: size.width,
          height: 44,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                height: 44,
                color: Colors.black,
                child: const Text(
                  '二级导航',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
