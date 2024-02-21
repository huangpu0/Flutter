import 'package:flutter/material.dart';
import 'package:flutter01/12_BottonTabBars/12_home.dart';
import 'package:flutter01/12_BottonTabBars/12_me.dart';
import 'package:flutter01/12_BottonTabBars/12_message.dart';

class MyAppBar0 extends StatefulWidget {
  const MyAppBar0({super.key});

  @override
  State<MyAppBar0> createState() => _MyAppBar0State();
}

class _MyAppBar0State extends State<MyAppBar0>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  /// 生命周期函数
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  /// 当前选中位置
  int currentPath = 0;

  /// tabs 页面
  List<Widget> tabBars = const [MyHome12(), MyMessage12(), MyMe12()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // ignore: avoid_print
              print('左侧按钮图标');
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Flutter App'),
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
        children: [
          const Text('首页'),
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

      /// 侧边栏
      drawer: const Drawer(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      image: DecorationImage(
                          image: AssetImage('images/load_1.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.people),
                          ),
                          title: Text(
                            '张三',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.people),
            ),
            title: Text('个人信息'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.settings),
            ),
            title: Text('系统设置'),
          ),
          Divider(),
        ],
      )),
      endDrawer: const Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}
