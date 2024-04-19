import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:flutter01/Routors/RoutersEnum.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _getListData() {
    var dataSource = [
      RoutersEnum.container,
      RoutersEnum.text,
      RoutersEnum.image,
      RoutersEnum.icon,
      RoutersEnum.button,
      RoutersEnum.scaffold,
      RoutersEnum.appbar,
      RoutersEnum.dialog,
      RoutersEnum.key,
      RoutersEnum.animated,
      RoutersEnum.listView,
      RoutersEnum.gridView,
      RoutersEnum.pageView,
      RoutersEnum.get,
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      return GestureDetector(
        onTap: () {
          // 1、原生路由跳转
          // Navigator.pushNamed(context, routerName(e), arguments: {
          //   'title': routerTitle(e),
          // });
          // 2、Get方式路由跳转
          Get.toNamed(
            routerName(e),
            arguments: {'title': routerTitle(e)},
          );
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
          title: const Text('首页'),
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
