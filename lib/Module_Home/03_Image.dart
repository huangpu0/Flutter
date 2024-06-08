import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/ModuleSubItem.dart';
import 'package:get/get.dart';

class MyImage extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyImage({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyImage({
    super.key,
  });

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  List<Widget> _getListData() {
    var dataSource = [
      {'title': '本地图片展示', 'wchild': const MyImage0()},
      {'title': '网络图片展示', 'wchild': const MyImage1()},
      {'title': 'Circular圆形图片', 'wchild': const MyImage2()},
      {'title': 'ClipOva圆形图片', 'wchild': const MyImage3()},
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      var e2 = e['wchild'] as Widget;
      return ModuleSubItem(title: e['title'].toString(), wchild: e2);
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
          childAspectRatio: screenSize.width / 200,
          // 每行数量
          crossAxisCount: 1,
          children: _getListData(),
        ));
  }
}

// 加载本地图片
class MyImage0 extends StatelessWidget {
  const MyImage0({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/load_1.jpeg',
      fit: BoxFit.cover,
    );
  }
}

class MyImage1 extends StatelessWidget {
  const MyImage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
      child: Image.network(
        'https://foruda.gitee.com/avatar/1676982612219119174/1672875_huangpu0_1578957408.png!avatar200',
        fit: BoxFit.cover, // 剪裁充满容器
        repeat: ImageRepeat.repeatY, // 平铺
      ),
    );
  }
}

class MyImage2 extends StatelessWidget {
  const MyImage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        alignment: Alignment.center,
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(
            image: NetworkImage(
                'https://foruda.gitee.com/avatar/1676982612219119174/1672875_huangpu0_1578957408.png!avatar200'),
            fit: BoxFit.cover,
          ),
        ));
  }
}

// 实现一个圆形图片 使用 ClipOva
class MyImage3 extends StatelessWidget {
  const MyImage3({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        'https://foruda.gitee.com/avatar/1676982612219119174/1672875_huangpu0_1578957408.png!avatar200',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
