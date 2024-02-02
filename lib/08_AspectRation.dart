import 'package:flutter/material.dart';
import 'package:flutter01/res/listData.dart';

class MyAspectRation0 extends StatelessWidget {
  const MyAspectRation0({super.key});

  /// 显示一个容器、宽度是屏幕宽度、高度时宽度一半
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

class MyAspectRation1 extends StatelessWidget {
  const MyAspectRation1({super.key});

  /// 显示一个容器、宽度是屏幕宽度、高度时宽度一半
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            /// 阴影效果
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            /// 阴影的深度
            elevation: 10,
            margin: const EdgeInsets.all(10),
            color: Colors.orange,
            shadowColor: Colors.black,
            child: const Column(
              children: [
                ListTile(
                  title: Text(
                    '张三',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  subtitle: Text('高级软件工程师'),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    '电话: 1234567890',
                  ),
                ),
                ListTile(
                  title: Text(
                    '地址: 北京天安门',
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class MyAspectRation2 extends StatelessWidget {
  const MyAspectRation2({super.key});

  List<Widget> initCardData() {
    var tmpList = listData.map((e) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 20,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                e['image'],
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  e['image'],
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
              title: Text(e['title']),
              subtitle: Text(e['subtitle']),
            ),
          ],
        ),
      );
    });
    return tmpList.toList();
  }

  /// 显示一个容器、宽度是屏幕宽度、高度时宽度一半
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: initCardData(),
    );
  }
}
