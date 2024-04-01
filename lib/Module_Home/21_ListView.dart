import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:flutter01/Routors/RoutersEnum.dart';
import '../DataSource/listData.dart';

class MyListView extends StatefulWidget {
  final Map arguments;
  const MyListView({super.key, required this.arguments});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<Widget> _getListData() {
    var dataSource = [
      RoutersEnum.container,
      RoutersEnum.text,
      RoutersEnum.image,
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routerName(e), arguments: {
            'title': routerTitle(e),
          });
        },
        child: HomePageItem(
          title: routerTitle(e),
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
          title: Text(widget.arguments["title"]),
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

/// 1、基本使用
class MyListView0 extends StatefulWidget {
  final Map arguments;
  const MyListView0({super.key, required this.arguments});

  @override
  State<MyListView0> createState() => _MyListView0State();
}

class _MyListView0State extends State<MyListView0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: ListView(
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
      ),
    );
  }
}

/// 2、设置大小
class MyListView1 extends StatefulWidget {
  final Map arguments;
  const MyListView1({super.key, required this.arguments});

  @override
  State<MyListView1> createState() => _MyListView1State();
}

class _MyListView1State extends State<MyListView1> {
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

/// 3、动态列表
class MyListView2 extends StatefulWidget {
  final Map arguments;
  const MyListView2({super.key, required this.arguments});

  @override
  State<MyListView2> createState() => _MyListView2State();
}

class _MyListView2State extends State<MyListView2> {
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
