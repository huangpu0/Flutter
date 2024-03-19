import 'package:flutter/material.dart';
import 'package:flutter01/16_PageView/16_CycleAdView.dart';

class MyPageView0 extends StatefulWidget {
  final Map arguments;
  const MyPageView0({super.key, required this.arguments});

  @override
  State<MyPageView0> createState() => _MyPageView0State();
}

class _MyPageView0State extends State<MyPageView0> {
  /// 写法1 数据源部分
  List<Widget> list = [];

  /// 写法3 轮播图数据
  List<String> images = const [
    'images/load_1.jpeg',
    'images/load_2.jpeg',
    'images/load_3.jpeg',
    'images/load_4.jpeg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add(Center(
        child: Text('第$i屏'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        title: Text('${widget.arguments["title"].toString()}'),
      ),

      /// 写法1
      // body: PageView(
      //   scrollDirection: Axis.vertical,
      //   onPageChanged: (index) {
      //     // ignore: avoid_print
      //     print(index);
      //     if (index + 1 == list.length) {
      //       setState(() {
      //         for (var i = 0; i < 10; i++) {
      //           list.add(Center(
      //             child: Text('第<$i>屏'),
      //           ));
      //         }
      //       });
      //     }
      //   },
      //   children: list,
      // ),

      /// 写法2
      // body: PageView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: 10,
      //     itemBuilder: (context, index) {
      //       return Center(
      //         child: Text('第$index屏 '),
      //       );
      //     }),

      /// 写法3 轮播图
      body: ListView(
        children: [
          CycleAdView(list: images),
        ],
      ),
    );
  }
}
