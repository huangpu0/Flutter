import 'package:flutter/material.dart';

// 水平、垂直布局
class MyRow extends StatefulWidget {
  final Map arguments;
  const MyRow({super.key, required this.arguments});

  @override
  State<MyRow> createState() => _MyRowState();
}

class _MyRowState extends State<MyRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: Container(
        width: 400,
        height: 700,
        color: Colors.black12,
        child: Row(
          /// 外部没有Container 行是自适应的
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 一个在左、一个在右
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyIconCon(Icons.home),
            MyIconCon(
              Icons.search,
              corlor: Colors.black,
            ),
            MyIconCon(
              Icons.ac_unit_sharp,
              corlor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class MyColumn extends StatefulWidget {
  final Map arguments;
  const MyColumn({super.key, required this.arguments});

  @override
  State<MyColumn> createState() => _MyColumnState();
}

class _MyColumnState extends State<MyColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: Container(
        width: 400,
        height: 700,
        color: Colors.black12,
        child: Column(
          /// 外部没有Container 行是自适应的
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 一个在左、一个在右
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyIconCon(Icons.home),
            MyIconCon(
              Icons.search,
              corlor: Colors.black,
            ),
            MyIconCon(
              Icons.ac_unit_sharp,
              corlor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyIconCon extends StatelessWidget {
  Color corlor;
  IconData icon;

  MyIconCon(this.icon, {super.key, this.corlor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      color: corlor,
      child: Icon(
        icon,
        color: Colors.yellow,
        size: 28,
      ),
    );
  }
}
