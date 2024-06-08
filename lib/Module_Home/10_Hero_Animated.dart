import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../DataSource/listData.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MyAnimatedHero extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyAnimatedHero({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyAnimatedHero({
    super.key,
  });

  @override
  State<MyAnimatedHero> createState() => _MyAnimatedHeroState();
}

class _MyAnimatedHeroState extends State<MyAnimatedHero> {
  List<Widget> _getListData() {
    var tmpList = listData.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/home_Ani_MyHero', arguments: {
            'id': e['id'],
            'image': e['image'],
            'data': listData,
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
          // 1、原生路由接收数据
          //title: Text(widget.arguments["title"]),
          // 2、Get方式路由跳转接收数据
          title: Text(Get.arguments['title']),
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
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyHero({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyHero({
    super.key,
  });

  @override
  State<MyHero> createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {
  late int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = Get.arguments['id'];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: Get.arguments["image"],
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: PhotoViewGallery.builder(
                      itemCount: Get.arguments['data'].length,
                      pageController:
                          PageController(initialPage: Get.arguments['id'] - 1),
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index + 1;
                        });
                      },
                      builder: (context, index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider:
                              AssetImage(Get.arguments['data'][index]['image']),
                        );
                      }),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 30,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$currentIndex/${Get.arguments['data'].length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
