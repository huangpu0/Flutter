import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';

class MyAnimated extends StatefulWidget {
  final Map arguments;
  const MyAnimated({Key? key, required this.arguments}) : super(key: key);

  @override
  State<MyAnimated> createState() => _MyAnimatedState();
}

class _MyAnimatedState extends State<MyAnimated> {
  List<Widget> _getListData() {
    var dataSource = [
      {
        'title': '1、动画位移',
        'type': 1,
      },
      {
        'title': '2、动画Padding',
        'type': 2,
      },
      {
        'title': '3、动画Opacity',
        'type': 3,
      },
      {
        'title': '4、购物车动画',
        'type': 4,
      },
      {
        'title': '5、字体大小变化',
        'type': 5,
      },
      {
        'title': '6、AnimatedSwitcher',
        'type': 6,
      },
      {
        'title': '7、旋转动画',
        'type': 7,
      },
      {
        'title': '8、比例动画',
        'type': 8,
      },
      {
        'title': '9、图片动画',
        'type': 9,
      },
      {
        'title': '10、交错式动画',
        'type': 10,
      },
      {
        'title': '11、AnimatedList',
        'type': 11,
      },
      {
        'title': '12、Hero动画-图片预览',
        'type': 12,
      },
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      return GestureDetector(
        onTap: () {
          var anitype = e['type'];
          switch (anitype) {
            case 11:
              Navigator.pushNamed(context, '/home_Ani_List', arguments: {
                'title': e['title'],
              });
              break;
            case 12:
              Navigator.pushNamed(context, '/home_Ani_Hero', arguments: {
                'title': e['title'],
              });
              break;
            default:
              Navigator.pushNamed(context, '/home_Ani_show', arguments: {
                'title': e['title'],
                'type': e['type'],
              });
          }
        },
        child: HomePageItem(
          title: e['title'].toString(),
        ),
      );
    });
    return wlist.toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.arguments["title"]),
        ),
        body: GridView.count(
          scrollDirection: Axis.vertical,
          childAspectRatio: screenSize.width / 45,
          // 每行数量
          crossAxisCount: 1,
          children: _getListData(),
        ));
  }
}

class MyAnimated0 extends StatefulWidget {
  final Map arguments;
  const MyAnimated0({super.key, required this.arguments});

  @override
  State<MyAnimated0> createState() => _MyAnimated0State();
}

class _MyAnimated0State extends State<MyAnimated0>
    with SingleTickerProviderStateMixin {
  bool flag = true;

  //// 显示动画1、旋转动画
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      // 程序与手机刷新频率一致
      vsync: this,
      duration: const Duration(seconds: 1),
      // 透明度 ( 0.5～1)
      // lowerBound: 0.5,
      // upperBound: 1,
    );
  }

  // 展示动画类型
  Widget showWidget() {
    var sType = widget.arguments['type'] as int;
    switch (sType) {
      case 1:
        // 属性动画 1、动画位移
        return Center(
            child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: flag ? 200 : 300,
          height: flag ? 200 : 300,

          /// 位移向右 100
          transform: Matrix4.translationValues(flag ? 0 : 100, 0, 0),
          color: Colors.red,
        ));

      case 2:
        // 2、动画Padding
        return AnimatedPadding(
          curve: Curves.bounceInOut,
          padding: EdgeInsets.fromLTRB(10, flag ? 10 : 400, 0, 0),
          duration: const Duration(seconds: 2),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        );

      case 3:
        // 3、动画 Opacity
        return Center(
            child: AnimatedOpacity(
          curve: Curves.easeIn,
          opacity: flag ? 0.1 : 1,
          duration: const Duration(seconds: 2),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ));

      case 4:
        // 4、购物车动画
        return Stack(
          children: [
            ListView(
              children: const [
                ListTile(
                  title: Text('列表数据1'),
                ),
                ListTile(
                  title: Text('列表数据2'),
                ),
                ListTile(
                  title: Text('列表数据3'),
                ),
              ],
            ),
            AnimatedPositioned(
                curve: Curves.linear,
                right: flag ? 10 : 300,
                top: flag ? 10 : 500,
                duration: const Duration(seconds: 2),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                )),
          ],
        );
      case 5:
        // 5、字体大小变化
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 300,
            color: Colors.blue,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 2),
              style: TextStyle(
                fontSize: flag ? 20 : 50,
              ),
              child: const Text(
                '文字',
              ),
            ),
          ),
        );

      case 6:
        // AnimatedSwitcher
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 400,
            height: 220,
            color: Colors.yellow,
            //// 只有Child子元素改变时触发动画
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                // 自定义动画效果、放大缩小、也可组合动画
                return ScaleTransition(
                  scale: animation,
                  // 透明度变化
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              duration: const Duration(seconds: 2),
              child: Text(
                key: UniqueKey(),
                flag ? '你好flutter' : '你好老师',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // child: flag
              //     ? const CircularProgressIndicator()
              //     : Image.asset(
              //         'images/load_1.jpeg',
              //         fit: BoxFit.cover,
              //       ),
            ),
          ),
        );

      case 7:
        // 7、旋转动画
        return Center(
          child: RotationTransition(
            turns: _controller,
            child: const FlutterLogo(
              size: 60,
            ),
          ),
        );

      case 8:
        // 8、比例动画
        return Center(
          child: ScaleTransition(
            // (100 ~ 200) Tween 配置运动参数
            scale: _controller.drive(Tween(begin: 0.5, end: 1)),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
        );

      case 9:
        // 9、图片动画
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller,
              size: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.home_menu,
              progress: _controller,
              size: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.search_ellipsis,
              progress: _controller,
              size: 40,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));

      case 10:
        // 10、交错式动画
        return Center(
          child: Stack(
            children: [
              // 0 ~ 0.5s Search 消失 0.5 ～ 1s Close显示
              ScaleTransition(
                scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
                    .chain(CurveTween(curve: const Interval(0.5, 1.0)))),
                child: const Icon(
                  Icons.close,
                  size: 40,
                ),
              ),
              ScaleTransition(
                scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
                    .chain(CurveTween(curve: const Interval(0.0, 0.5)))),
                child: const Icon(
                  Icons.search,
                  size: 40,
                ),
              ),
            ],
          ),
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var type = widget.arguments['type'];
            if (type == 10) {
              flag ? _controller.forward() : _controller.reverse();
              flag = !flag;
            } else {
              flag = !flag;
              // 循环播放
              _controller.repeat();
              // 正序播放一次
              // _controller.forward();
              // 倒序播放一次
              // _controller.reverse();
              // _controller.reset();
              // _controller.stop();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: showWidget(),
    );
  }
}
