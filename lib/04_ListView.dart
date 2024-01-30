import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'res/listData.dart';

/// 基本使用
class MyListView0 extends StatelessWidget {
  const MyListView0({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.home),
          title: Text('我是一个列表'),
          trailing: Icon(Icons.chevron_right_sharp),
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
  }
}

/// 设置大小
class MyListView1 extends StatelessWidget {
  const MyListView1({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}

/// 动态列表
class MyListView2 extends StatelessWidget {
  const MyListView2({super.key});

  /// 自定义方法
  List<Widget> initListData0() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(const ListTile(
        title: Text('这是一个列表'),
      ));
    }
    return list;
  }

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

  @override
  Widget build(BuildContext context) {
    return ListView(children: initListData1());
  }
}

// ignore: must_be_immutable
/// 动态数据处理方式
class MyListView3 extends StatelessWidget {
  List<String> list = [];

  MyListView3({super.key}) {
    for (var i = 0; i < 20; i++) {
      list.add('我是第--$i--数据');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]),
          );
        });
  }
}
