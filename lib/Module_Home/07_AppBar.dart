import 'package:flutter/material.dart';
import 'package:flutter01/12_BottonTabBars/12_home.dart';
import 'package:flutter01/12_BottonTabBars/12_me.dart';
import 'package:flutter01/12_BottonTabBars/12_message.dart';

class MyAppBar extends StatefulWidget {
  final Map arguments;
  const MyAppBar({super.key, required this.arguments});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  /// tabs 页面
  List<Widget> tabBars = const [MyHome12(), MyMessage12(), MyMe12()];

  /// 生命周期函数
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(widget.arguments["title"]),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              // ignore: avoid_print
              print('右侧按钮图标1');
            },
            icon: const Icon(Icons.people),
          ),
          IconButton(
            onPressed: () {
              // ignore: avoid_print
              print('右侧按钮图标2');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        bottom: TabBar(
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
              Tab(
                child: Text('我的'),
              ),
            ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabBars,
      ),
    );
  }
}
