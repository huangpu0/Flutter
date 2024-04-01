import 'package:flutter/material.dart';
import 'package:flutter01/DataSource/listData.dart';

class MyAspectRation0 extends StatefulWidget {
  final Map arguments;
  const MyAspectRation0({super.key, required this.arguments});

  @override
  State<MyAspectRation0> createState() => _MyAspectRation0State();
}

class _MyAspectRation0State extends State<MyAspectRation0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: AspectRatio(
        aspectRatio: 2 / 1,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}

class MyAspectRation1 extends StatefulWidget {
  final Map arguments;
  const MyAspectRation1({super.key, required this.arguments});

  @override
  State<MyAspectRation1> createState() => _MyAspectRation1State();
}

class _MyAspectRation1State extends State<MyAspectRation1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: ListView.builder(
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
        },
      ),
    );
  }
}

class MyAspectRation2 extends StatefulWidget {
  final Map arguments;
  const MyAspectRation2({super.key, required this.arguments});

  @override
  State<MyAspectRation2> createState() => _MyAspectRation2State();
}

class _MyAspectRation2State extends State<MyAspectRation2> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: ListView(
        children: initCardData(),
      ),
    );
  }
}
