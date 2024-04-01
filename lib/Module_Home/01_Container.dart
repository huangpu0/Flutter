import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  final Map arguments;
  const MyContainer({super.key, required this.arguments});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          alignment: Alignment.center,
          width: 200,
          height: 200,
          // transform: Matrix4.translationValues( 40, 0, 0), /// 位移40
          // transform: Matrix4.rotationZ(0.2), /// 旋转
          transform: Matrix4.skewY(.2),

          /// 倾斜
          decoration: BoxDecoration(
              color: Colors.yellow, //背景颜色
              border: Border.all(
                  //边框
                  color: Colors.red,
                  width: 2),
              borderRadius: BorderRadius.circular(100), // 圆角
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                )
              ], // 配置阴影效果
              /// 渐变色 LinearGradient 线性渐变 RadialGradient 径向渐变
              gradient:
                  const LinearGradient(colors: [Colors.red, Colors.yellow])),
          child: const Text(
            '你好呀,Flutter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
