import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 40,
      // 四周margin
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      // 内边距padding
      //padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20), // 圆角
      ),
      child: const Text(
        '按钮',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
      child: const Text('你好,我是Flutter你好,我是Flutter你好,我是Flutter你好,我是Flutter你好,我是Flutter你好,我是Flutter',
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis, // 溢出显示... 
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic, // 倾斜
          letterSpacing: 3, // 字体间距
          decoration: TextDecoration.underline,  // 下划线 
          decorationColor: Colors.black, // 下划线颜色
          decorationStyle: TextDecorationStyle.dashed // 虚线
        ),
      ),
    );
  }
}
