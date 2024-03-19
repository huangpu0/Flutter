import 'package:flutter/material.dart';

class MyMessage12 extends StatefulWidget {
  const MyMessage12({super.key});

  @override
  State<MyMessage12> createState() => _MyMessage12State();
}

class _MyMessage12State extends State<MyMessage12> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          /// 3、命名路由跳转传值 Dialog
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/dialog", arguments: {
                  "title": "Dialog",
                  "type": 0,
                });
              },
              child: const Text('Dialog_Demo')),

          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/pageView", arguments: {
                  "title": "PageView",
                  "type": 1,
                });
              },
              child: const Text('PageView_Demo')),

          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/pageViewKeepAlive", arguments: {
                  "title": "KeepAlive",
                  "type": 1,
                });
              },
              child: const Text('KeepAlive_Demo')),
        ],
      ),
    );
  }
}
