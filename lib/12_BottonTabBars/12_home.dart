import 'package:flutter/material.dart';
import 'package:flutter01/12_BottonTabBars/12_me.dart';
import 'package:flutter01/12_BottonTabBars/12_message.dart';

class MyHome12 extends StatefulWidget {
  const MyHome12({super.key});

  @override
  State<MyHome12> createState() => _MyHome12State();
}

class _MyHome12State extends State<MyHome12>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  /// 生命周期函数
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    /// 监听tabs 点击事件
    tabController.addListener(() {
      // ignore: avoid_print
      if (tabController.animation!.value == tabController.index) {
        // ignore: avoid_print
        print(tabController.index);
      }
    });
  }

  /// 当前选中位置
  int currentPath = 0;

  /// tabs 页面
  List<Widget> tabBars = const [MyMessage12(), MyMe12()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.blue,
          title: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 2,
              indicatorPadding: const EdgeInsets.all(5),
              // indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              tabs: const [
                Tab(
                  child: Text('首页'),
                ),
                Tab(
                  child: Text('消息'),
                ),
              ]),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView(
            children: const [
              ListTile(
                title: Text('我是消息1'),
              ),
              ListTile(
                title: Text('我是消息2'),
              ),
              ListTile(
                title: Text('我是消息3'),
              ),
            ],
          ),
          ListView(
            children: const [
              ListTile(
                title: Text('我的1'),
              ),
              ListTile(
                title: Text('我的2'),
              ),
              ListTile(
                title: Text('我的3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
