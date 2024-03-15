import 'package:flutter/material.dart';

// ignore: camel_case_types
class MyDialog_0 extends Dialog {
  final String title;
  final String content;
  final Function()? onTap;
  const MyDialog_0(
      {required this.title,
      required this.content,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      /// 背景透明效果
      type: MaterialType.transparency,

      /// 主要要包裹一个组件、避免全屏
      child: Center(
        child: Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(title),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: onTap,
                          child: const Icon(Icons.close),
                          // onTap: () {
                          //   // ignore: avoid_print
                          //   print('X');
                          //   Navigator.of(context).pop('X 点击关闭');
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Text(content),
                )
              ],
            )),
      ),
    );
  }
}
