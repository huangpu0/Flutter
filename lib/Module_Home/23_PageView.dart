import 'package:flutter/material.dart';
import 'package:flutter01/23_PageView/23_CycleAdView.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:get/get.dart';

class MyPageView extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyPageView({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyPageView({
    super.key,
  });

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  List<Widget> _getListData() {
    var dataSource = [
      {
        'title': '1、PageView(基本用法)',
        'type': 1,
      },
      {
        'title': '2、PageView(builder写法)',
        'type': 2,
      },
      {
        'title': '3、PageView(头部轮播图)',
        'type': 3,
      },
      {
        'title': '4、PageView(KeepAlive缓存页面)',
        'type': 4,
      },
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      return GestureDetector(
        onTap: () {
          if (e['type'] == 4) {
            Navigator.pushNamed(context, '/home_PageView_KeepAlive',
                arguments: e);
          } else {
            Navigator.pushNamed(context, '/home_PageView_Show', arguments: e);
          }
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

class MyPageView0 extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyPageView0({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyPageView0({
    super.key,
  });

  @override
  State<MyPageView0> createState() => _MyPageView0State();
}

class _MyPageView0State extends State<MyPageView0> {
  Widget showPageViewWidget() {
    var sType = Get.arguments['type'] as int;

    switch (sType) {
      case 1:
        //1、PageView(基本用法)
        List<Widget> list = [];
        for (var i = 0; i < 10; i++) {
          list.add(Center(
            child: Text('第$i屏'),
          ));
        }
        return PageView(
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            // ignore: avoid_print
            print(index);
            if (index + 1 == list.length) {
              setState(() {
                for (var i = 0; i < 10; i++) {
                  list.add(Center(
                    child: Text('kk+第<$i>屏'),
                  ));
                }
              });
            }
          },
          children: list,
        );

      case 2:
        //2、PageView(builder写法)
        return PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Center(
                child: Text('第$index屏 '),
              );
            });
      case 3:
        //3、PageView(头部轮播图)
        List<String> images = const [
          'images/load_1.jpeg',
          'images/load_2.jpeg',
          'images/load_3.jpeg',
          'images/load_4.jpeg',
        ];
        return ListView(
          children: [
            CycleAdView(list: images),
          ],
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
      body: showPageViewWidget(),
    );
  }
}
