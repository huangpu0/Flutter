import 'package:flutter/material.dart';

/*
在Flutter中，Key是不能重复使用的，所以Key一般用来做唯一标识。组件在更新的时候，其状态的保
存主要是通过判断组件的类型或者key值是否一致。因此，当各组件的类型不同的时候，类型已经足够
用来区分不同的组件了，此时我们可以不必使用key。但是如果同时存在多个同一类型的控件的时候，
此时类型已经无法作为区分的条件了，我们就需要使用到key。
*/

/*
 Flutter key子类包含 LocalKey 和 GlobalKey 。
 局部键（LocalKey）：ValueKey、ObjectKey、UniqueKey
 全局键（GlobalKey）： GlobalKey、GlobalObjectKey

 ValueKey （值key）把一个值作为key ，UniqueKey（唯一key）程序生成唯一的Key，当我们不知道
 如何指定ValueKey的时候就可以使用UniqueKey，ObjectKey（对象key）把一个对象实例作为key。
 GlobalKey（全局key），GlobalObjectKey（全局Objec key，和ObjectKey有点类似）
 */

class MyKey0 extends StatefulWidget {
  final Map arguments;
  const MyKey0({Key? key, required this.arguments}) : super(key: key);

  @override
  State<MyKey0> createState() => _MyKey0State();
}

class _MyKey0State extends State<MyKey0> {
  /// GlobalKey
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey _globalKey2 = GlobalKey();
  final GlobalKey _globalKey3 = GlobalKey();

  /// 1、保存状态 2、可以排序 LocalKey
  List<Widget> list = [
    // const MyBox(key: ValueKey('1'), color: Colors.red),

    // /// UniqueKey 唯一值、每次允许随机生成
    // MyBox(key: UniqueKey(), color: Colors.yellow),

    // /// ObjectKey 传入对象
    // const MyBox(key: ObjectKey(MyBox(color: Colors.blue)), color: Colors.blue),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      MyBox(key: _globalKey1, color: Colors.red),
      MyBox(key: _globalKey2, color: Colors.yellow),
      MyBox(key: _globalKey3, color: Colors.blue),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              //// 1、Key 简单实用 对list进行排序、打乱顺序
              //list.shuffle();

              /// 2、 GlobalKey 使用 获取子组件状态、属性、方法等
              var boxState = _globalKey1.currentState as _MyBoxState;
              // ignore: avoid_print
              print(boxState._count);
              setState(() {
                boxState._count++;
              });
              boxState.run();

              /// 2、获取子组件 Widget (了解 )
              var boxWidget = _globalKey1.currentWidget as MyBox;
              // ignore: avoid_print
              print(boxWidget.color); // 值: 颜色红色
              setState(() {
                /// 可读取、不可写入
                /// boxWidget.color = Colors.black;
              });

              /// 2、获取子 Widget 渲染属性 (了解 )
              var renderBox =
                  _globalKey1.currentContext!.findRenderObject() as RenderBox;
              // ignore: avoid_print
              print(renderBox.size); // 值: size(100, 100);
            });
          }),
      appBar: AppBar(
        title: Text(widget.arguments["title"].toString()),
      ),
      // 1、Key 简单实用
      // body: Center(
      //   /// 设备屏幕方向
      //   child: MediaQuery.of(context).orientation == Orientation.portrait ?
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: list,
      //   ): Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: list,
      //   ),
      // ),
      // 2、 GlobalKey 使用 获取子组件状态属性等
      body: Center(
        child: MyBox(key: _globalKey1, color: Colors.red),
      ),
    );
  }
}

class MyBox extends StatefulWidget {
  final Color color;
  const MyBox({super.key, required this.color});

  @override
  State<MyBox> createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  int _count = 0;
  void run() {
    // ignore: avoid_print
    print('我是MyBox run方法');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.color),
        ),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Text(
          '$_count',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
