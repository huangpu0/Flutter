import 'package:flutter/material.dart';
import 'package:flutter01/DataSource/listData.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:get/get.dart';

class MyGridView extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyGridView({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyGridView({
    super.key,
  });

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  List<Widget> _getListData() {
    var dataSource = [
      {
        'title': '1、GridView(count形式动态加载)',
        'type': 1,
      },
      {
        'title': '2、GridView(extent形式动态加载)',
        'type': 2,
      },
      {
        'title': '3、GridView(builder形式动态加载)',
        'type': 3,
      },
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/home_GridView_Show', arguments: e);
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

class MyGridView0 extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyGridView0({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyGridView0({
    super.key,
  });

  @override
  State<MyGridView0> createState() => _MyGridView0State();
}

class _MyGridView0State extends State<MyGridView0> {
  // 展示Liew类型
  Widget showGridViewWidget() {
    var sType = Get.arguments['type'] as int;
    switch (sType) {
      case 1:
        // 1、GridView(count形式动态加载)
        List<Widget> initGridData1() {
          var tmpList = listData.map((e) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blue,
                  )),
              child: Column(
                children: [
                  Image.asset(e['image']),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    e["title"],
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          });
          return tmpList.toList();
        }
        return GridView.count(
          padding: const EdgeInsets.all(10), // 间距
          /// 一 行显示多少个
          crossAxisCount: 3,

          /// 水平间距
          crossAxisSpacing: 10,

          /// 垂直间距
          mainAxisSpacing: 10,

          /// 子元素宽高比例
          childAspectRatio: 0.7,

          children: initGridData1(),
        );

      case 2:
        // 2、GridView(extent形式动态加载)
        return GridView.extent(
          maxCrossAxisExtent: 80.0,
          childAspectRatio: 1.0,
          children: const <Widget>[
            Icon(Icons.home),
            Icon(Icons.ac_unit),
            Icon(Icons.search),
            Icon(Icons.settings),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.circle),
          ],
        );

      case 3:
        // 3、ListView动态列表
        Widget initGridData0(context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                )),
            child: Column(
              children: [
                Image.asset(listData[index]['image']),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  listData[index]["title"],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10), // 间距
          itemCount: listData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            /// 一 行显示多少个
            crossAxisCount: 3,

            /// 水平间距
            crossAxisSpacing: 10,

            /// 垂直间距
            mainAxisSpacing: 10,

            /// 子元素宽高比例
            childAspectRatio: 0.7,
          ),

          itemBuilder: initGridData0,
        );
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
      body: showGridViewWidget(),
    );
  }
}
