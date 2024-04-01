import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:flutter01/Routors/RoutersEnum.dart';

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
