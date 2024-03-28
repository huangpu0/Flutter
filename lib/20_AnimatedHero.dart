import 'package:flutter/material.dart';
import '../res/listData.dart';

class MyAnimatedHero0 extends StatefulWidget {
  final Map arguments;
  const MyAnimatedHero0({super.key, required this.arguments});

  @override
  State<MyAnimatedHero0> createState() => _MyAnimatedHero0State();
}

class _MyAnimatedHero0State extends State<MyAnimatedHero0> {
  List<Widget> _getListData() {
    var tmpList = listData.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/hero', arguments: {
            'image': e['image'],
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1),
          ),
          child: Column(
            children: <Widget>[
              Hero(
                  tag: e['image'],
                  child: Image.asset(
                    e['image'],
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                e['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      );
    });
    return tmpList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.arguments["title"].toString()),
        ),
        body: GridView.count(
          // 水平垂直间距
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          // 每行数量
          crossAxisCount: 2,
          children: _getListData(),
        ));
  }
}

// MyHero0
class MyHero0 extends StatefulWidget {
  final Map arguments;
  const MyHero0({super.key, required this.arguments});

  @override
  State<MyHero0> createState() => _MyHero0State();
}

class _MyHero0State extends State<MyHero0> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: widget.arguments["image"],
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  widget.arguments["image"],
                ),
              ),
            ),
          ),
        ));
  }
}
