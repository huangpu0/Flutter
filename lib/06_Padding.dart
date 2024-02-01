import 'package:flutter/material.dart';

/// Padding
class MyPadding0 extends StatelessWidget {
  const MyPadding0({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text('你好Flutter'),
    );
  }
}

/// 水平布局、垂直布局
class MyRow0 extends StatelessWidget {
  const MyRow0({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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

/// 弹性布局
class MyFlex0 extends StatelessWidget {
  const MyFlex0({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: 600,
          height: 200,
          color: Colors.green,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blueGrey,
                  height: 180,
                  child: Image.asset(
                    'images/tab_flag_pre.png',
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.blue,
                  height: 180,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/tab_flag_pre.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/tab_flag_pre.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }
}
