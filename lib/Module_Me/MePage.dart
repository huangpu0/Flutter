import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:flutter01/Routors/RoutersEnum.dart';
import 'package:get/get.dart';

class MePage extends StatefulWidget {
  const MePage({super.key});
  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  List<Widget> _getListData() {
    var dataSource = [
      RoutersEnum.padding,
      RoutersEnum.row,
      RoutersEnum.column,
      RoutersEnum.flex,
      RoutersEnum.stack0,
      RoutersEnum.stack1,
      RoutersEnum.wrap0,
      RoutersEnum.wrap1,
      RoutersEnum.aspectRation0,
      RoutersEnum.aspectRation1,
      RoutersEnum.aspectRation2,
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
          title: const Text('我的'),
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
