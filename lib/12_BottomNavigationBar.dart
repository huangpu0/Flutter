import 'package:flutter/material.dart';
import 'package:flutter01/12_BottonTabBars/12_home.dart';
import 'package:flutter01/12_BottonTabBars/12_me.dart';
import 'package:flutter01/12_BottonTabBars/12_message.dart';

class MyBottomNavigationBar0 extends StatefulWidget {
  const MyBottomNavigationBar0({super.key});

  @override
  State<MyBottomNavigationBar0> createState() => _MyBottomNavigationBar0State();
}

class _MyBottomNavigationBar0State extends State<MyBottomNavigationBar0> {
  /// 当前选中位置
  int currentPath = 0;

  /// tabs 页面
  List<Widget> tabBars = const [MyHome12(), MyMessage12(), MyMe12()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('你好Flutter'),
      ),
      body: tabBars[currentPath],

      /// 12_BottomNavigationBar 自定义底部导航条
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPath,
          unselectedIconTheme: const IconThemeData(color: Colors.black38),
          unselectedItemColor: Colors.black38,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          selectedItemColor: Colors.blue,
          onTap: (value) {
            setState(() {
              currentPath = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: '首页'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                ),
                label: '消息'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.face,
                ),
                label: '我的'),
          ]),
    );
  }
}
