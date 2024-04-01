import 'package:flutter/material.dart';
import '../DataSource/listData.dart';

class MyAnimatedHero extends StatefulWidget {
  final Map arguments;
  const MyAnimatedHero({super.key, required this.arguments});

  @override
  State<MyAnimatedHero> createState() => _MyAnimatedHeroState();
}

class _MyAnimatedHeroState extends State<MyAnimatedHero> {
  List<Widget> _getListData() {
    var tmpList = listData.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/home_Ani_MyHero', arguments: {
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
class MyHero extends StatefulWidget {
  final Map arguments;
  const MyHero({super.key, required this.arguments});

  @override
  State<MyHero> createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {
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
