import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:get/get.dart';
import '../DataSource/listData.dart';

class MyListView extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyListView({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyListView({
    super.key,
  });

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<Widget> _getListData() {
    var dataSource = [
      {
        'title': '1、ListView基本使用',
        'type': 1,
      },
      {
        'title': '2、ListView设置大小',
        'type': 2,
      },
      {
        'title': '3、ListView动态列表',
        'type': 3,
      },
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/home_ListView_Show', arguments: e);
        },
        child: HomePageItem(
          title: e['title'].toString(),
        ),
      );
    });
    return wlist.toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          // 1、原生路由接收数据
          //title: Text(widget.arguments["title"]),
          // 2、Get方式路由跳转接收数据
          title: Text(Get.arguments['title']),
        ),
        body: GridView.count(
          scrollDirection: Axis.vertical,
          childAspectRatio: screenSize.width / 45,
          // 每行数量
          crossAxisCount: 1,
          children: _getListData(),
        ));
  }
}

class MyListView0 extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyListView0({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyListView0({
    super.key,
  });

  @override
  State<MyListView0> createState() => _MyListView0State();
}

class _MyListView0State extends State<MyListView0> {
  // 展示Liew类型
  Widget showListViewWidget() {
    var sType = Get.arguments['type'] as int;
    switch (sType) {
      case 1:
        // 1、ListView基本使用
        return ListView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: const <Widget>[
            SizedBox(
              height: 100,
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('我是一个列表'),
                trailing: Icon(Icons.chevron_right_sharp),
              ),
            ),
            Divider(), //线
            ListTile(
              leading: Icon(Icons.home),
              title: Text('我是一个列表'),
            ),
            Divider(), //线
            ListTile(
              leading: Icon(Icons.home),
              title: Text('我是一个列表'),
            ),
            Divider(), //线
            ListTile(
              leading: Icon(Icons.home),
              title: Text('我是一个列表'),
            ),
            Divider(), //线
          ],
        );

      case 2:
        // 2、ListView设置大小
        /// 自适应、（宽度无效 垂直条件下） （高度度无效 水平条件下）
        /// 用SizedBox 控制其高度、宽度等
        return SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Image.asset(
                        'images/tab_flag_pre.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text('文字'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        );
      case 3:
        // 3、ListView动态列表

        /// 模拟数据
        List<Widget> initListData1() {
          List<Widget> tmpList = [];
          for (var i = 0; i < listData.length; i++) {
            tmpList.add(SizedBox(
              height: 50,
              child: ListTile(
                leading: Image.asset(
                  '${listData[i]['image']}',
                  fit: BoxFit.cover,
                ),
                title: Text('${listData[i]['title']}'),
                subtitle: Text('${listData[i]['subtitle']}'),
              ),
            ));
          }
          return tmpList;
        }

        return ListView(children: initListData1());
      default:
        return Container();
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
      body: showListViewWidget(),
    );
  }
}
