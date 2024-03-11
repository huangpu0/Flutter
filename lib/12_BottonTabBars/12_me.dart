import 'package:flutter/material.dart';
import 'package:flutter01/14_Navigator/14_Search.dart';

class MyMe12 extends StatefulWidget {
  const MyMe12({super.key});

  @override
  State<MyMe12> createState() => _MyMe12State();
}

class _MyMe12State extends State<MyMe12> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          /// 1、基本路由跳转
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const SearchPage0(title: '搜索页面');
                  }),
                );
              },
              child: const Text('跳转搜索页面')),
          const SizedBox(
            height: 20,
          ),

          /// 2、命名路由跳转
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              child: const Text('命名路由跳转Search页面')),
          const SizedBox(
            height: 20,
          ),

          /// 3、命名路由跳转传值
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/news", arguments: {
                  "title": "我是命名路由传值",
                  "aid": 20,
                });
              },
              child: const Text('命名路由传值跳转News页面')),
        ],
      ),
    );
  }
}
