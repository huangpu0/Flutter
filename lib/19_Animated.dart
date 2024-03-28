import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"].toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // flag = !flag;
            // 循环播放
            // _controller.repeat();
            // 正序播放一次
            // _controller.forward();
            // 倒序播放一次
            // _controller.reverse();
            // _controller.reset();
            // _controller.stop();

            /// 三、2、交错式动画
            flag ? _controller.forward() : _controller.reverse();
            flag = !flag;
          });
        },
        child: const Icon(Icons.add),
      ),
      //// 属性动画
      //// 1、动画位移
      // body: Center(
      //   child: AnimatedContainer(
      //     duration: const Duration(seconds: 2),
      //     width: flag ? 200 : 300,
      //     height: flag ? 200 : 300,
      //     /// 位移向右 100
      //     transform: Matrix4.translationValues(flag ? 0:100, 0, 0),
      //     color: Colors.red,
      //   ),
      // ),
      /// 2、动画Padding
      // body: AnimatedPadding(
      //   curve: Curves.bounceInOut,
      //   padding: EdgeInsets.fromLTRB(10, flag ? 10:400, 0, 0),
      // duration: const Duration(seconds: 2),
      // child: Container(
      //   width: 100,
      //   height: 100,
      //   color: Colors.red,
      // ),
      // ),
      //// 3、动画 Opacity
      // body: Center(
      //     child: AnimatedOpacity(
      //   curve: Curves.easeIn,
      //   opacity: flag ? 0.1 : 1,
      //   duration: const Duration(seconds: 2),
      //   child: Container(
      //     width: 200,
      //     height: 200,
      //     color: Colors.red,
      //   ),
      // )),
      //// 4、购物车动画
      // body: Stack(
      //   children: [
      //     ListView(
      //       children: const [
      //         ListTile(
      //           title: Text('列表数据1'),
      //         ),
      //         ListTile(
      //           title: Text('列表数据2'),
      //         ),
      //         ListTile(
      //           title: Text('列表数据3'),
      //         ),
      //       ],
      //     ),
      //     AnimatedPositioned(
      //         curve: Curves.linear,
      //         right: flag ? 10 : 300,
      //         top: flag ? 10 : 500,
      //         duration: const Duration(seconds: 2),
      //         child: Container(
      //           width: 80,
      //           height: 80,
      //           color: Colors.blue,
      //         )),
      //   ],
      // ),
      //// 5、字体大小变化
      // body: Center(
      //   child: Container(
      //     alignment: Alignment.center,
      //     width: 300,
      //     height: 300,
      //     color: Colors.blue,
      //     child: AnimatedDefaultTextStyle(
      //       duration: const Duration(seconds: 2),
      //       style: TextStyle(
      //         fontSize: flag ? 20:50,
      //       ),
      //       child:const Text(
      //         '文字',
      //       ),
      //     ),
      //   ),
      // ),
      //// AnimatedSwitcher
      // body: Center(
      //   child: Container(
      //     alignment: Alignment.center,
      //     width: 400,
      //     height: 220,
      //     color: Colors.yellow,
      //     //// 只有Child子元素改变时触发动画
      //     child: AnimatedSwitcher(
      //       transitionBuilder: (child, animation) {
      //         // 自定义动画效果、放大缩小、也可组合动画
      //         return ScaleTransition(
      //           scale: animation,
      //           // 透明度变化
      //           child: FadeTransition(
      //             opacity: animation,
      //             child: child,
      //           ),
      //         );
      //       },
      //       duration: const Duration(seconds: 2),
      //       child: Text(
      //         key: UniqueKey(),
      //         flag ? '你好flutter' : '你好老师',
      //         style: Theme.of(context).textTheme.bodyMedium,
      //       ),
      //       // child: flag
      //       //     ? const CircularProgressIndicator()
      //       //     : Image.asset(
      //       //         'images/load_1.jpeg',
      //       //         fit: BoxFit.cover,
      //       //       ),
      //     ),
      //   ),
      // ),

      //// 显示动画
      //// 1、旋转动画
      // body: Center(
      //   child: RotationTransition(
      //     turns: _controller,
      //     child: const FlutterLogo(
      //       size: 60,
      //     ),
      //   ),
      // ),

      //// 2、比例动画
      // body: Center(
      //   child: ScaleTransition(
      //     // (100 ~ 200) Tween 配置运动参数
      //     scale: _controller.drive(Tween(begin: 0.5, end: 1)),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.red,
      //     ),
      //     ),
      // ),

      //// 三、1、图片动画
      // body: Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     AnimatedIcon(
      //       icon: AnimatedIcons.close_menu,
      //       progress: _controller,
      //       size: 40,
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     AnimatedIcon(
      //       icon: AnimatedIcons.home_menu,
      //       progress: _controller,
      //       size: 40,
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     AnimatedIcon(
      //       icon: AnimatedIcons.search_ellipsis,
      //       progress: _controller,
      //       size: 40,
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //   ],
      // )),

      // 2、交错式动画
      body: Center(
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
      )),
    );
  }
}
