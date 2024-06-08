import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScaffold extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyScaffold({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyScaffold({
    super.key,
  });

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  // 左侧边栏
  Widget leftDrawer() {
    return const LeftDrawer();
  }

  // 右侧边栏
  Drawer rightDrawer() {
    return const Drawer(
      child: Text('右侧侧边栏'),
    );
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

      /// 左右侧边栏
      drawer: leftDrawer(),
      endDrawer: rightDrawer(),
      body: Container(),
    );
  }
}

// 左侧边栏
class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
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
                        image: AssetImage('images/load_1.jpeg'),
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
    ));
  }
}
