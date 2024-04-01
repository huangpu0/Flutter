import 'package:flutter/material.dart';

class MyWrap0 extends StatefulWidget {
  final Map arguments;
  const MyWrap0({super.key, required this.arguments});

  @override
  State<MyWrap0> createState() => _MyWrap0State();
}

class _MyWrap0State extends State<MyWrap0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          /// 水平间距
          spacing: 5,

          /// 垂直间距
          runSpacing: 10,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: [
            MyBtn0('第1集', onPressed: () {}),
            MyBtn0('第2集', onPressed: () {}),
            MyBtn0('第3集', onPressed: () {}),
            MyBtn0('第4集安徽', onPressed: () {}),
            MyBtn0('第5集', onPressed: () {}),
            MyBtn0('第6集测试数据', onPressed: () {}),
            MyBtn0('第7集', onPressed: () {}),
            MyBtn0('第8集', onPressed: () {}),
            MyBtn0('第9集测试', onPressed: () {}),
            MyBtn0('第10集', onPressed: () {}),
            MyBtn0('第11集', onPressed: () {}),
            MyBtn0('第12集哈哈哈', onPressed: () {}),
            MyBtn0('第13集', onPressed: () {}),
            MyBtn0('第14集噶', onPressed: () {}),
            MyBtn0('第15集', onPressed: () {}),
            MyBtn0('第16集', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBtn0 extends StatelessWidget {
  /// 文本、点击事件
  String text;
  void Function()? onPressed;

  MyBtn0(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.black12),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}

/// 搜索历史记录
class MyWrap1 extends StatefulWidget {
  final Map arguments;
  const MyWrap1({super.key, required this.arguments});

  @override
  State<MyWrap1> createState() => _MyWrap1State();
}

class _MyWrap1State extends State<MyWrap1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              Text(
                '热搜',
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          const Divider(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              MyBtn0('笔记本', onPressed: () {}),
              MyBtn0('Ipad', onPressed: () {}),
              MyBtn0('男装', onPressed: () {}),
              MyBtn0('女装', onPressed: () {}),
              MyBtn0('第6集测试数据', onPressed: () {}),
              MyBtn0('手机', onPressed: () {}),
              MyBtn0('连一圈的', onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '历史记录',
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          const Divider(),
          const Column(
            children: [
              ListTile(
                title: Text('女装'),
              ),
              Divider(),
              ListTile(
                title: Text('手机'),
              ),
              Divider(),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: OutlinedButton.icon(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black45)),
              onPressed: () {},
              icon: const Icon(Icons.delete),
              label: const Text('删除历史记录'),
            ),
          ),
        ],
      ),
    );
  }
}
