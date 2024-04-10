// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

/// 命名路由传值
class MyDialog extends StatefulWidget {
  final Map arguments;
  const MyDialog({super.key, required this.arguments});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  // ignore: unused_element
  void _altertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示信息"),
            content: const Text('您确定要删除吗？'),
            actions: [
              TextButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('ok');
                    Navigator.of(context).pop('确定');
                  },
                  child: const Text('确定')),
              TextButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('cancle');
                    Navigator.of(context).pop('取消');
                  },
                  child: const Text('取消')),
            ],
          );
        });

    // ignore: avoid_print
    print(result);
  }

  // ignore: unused_element
  void _simpleDialog() async {
    var result = await showDialog(

        /// 点击灰色背景也会消失
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("提示信息"),
            children: [
              SimpleDialogOption(
                child: const Text('Option A'),
                onPressed: () {
                  // ignore: avoid_print
                  print('a');
                  Navigator.pop(context, "aa");
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text('Option B'),
                onPressed: () {
                  // ignore: avoid_print
                  print('b');
                  Navigator.of(context).pop('bb');
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text('Option C'),
                onPressed: () {
                  // ignore: avoid_print
                  print('c');
                  Navigator.of(context).pop('cc');
                },
              ),
              const Divider(),
            ],
          );
        });

    // ignore: avoid_print
    print(result);
  }

  // ignore: unused_element
  void _showModelBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 240,
            child: Column(
              children: [
                ListTile(
                  title: const Text('分享A'),
                  onTap: () {
                    // ignore: avoid_print
                    print('分享AA');
                    Navigator.of(context).pop('分享AA');
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('分享B'),
                  onTap: () {
                    // ignore: avoid_print
                    print('分享AA');
                    Navigator.of(context).pop('分享BB');
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('取消'),
                  onTap: () {
                    // ignore: avoid_print
                    print('分享Cancle');
                    Navigator.of(context).pop('分享Cancle');
                  },
                ),
                const Divider(),
              ],
            ),
          );
        });
    // ignore: avoid_print
    print(result);
  }

  // ignore: unused_element
  void _fluttertoast() {
    // Fluttertoast.showToast(
    //     msg: '我是fluttertoast',
    //     backgroundColor: Colors.black54,
    //     textColor: Colors.white);
  }

  // ignore: unused_element
  void _MyDialog_0() async {
    var result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return MyDialog_0(
            title: '提示！',
            content: '我是一个提示信息！！！',
            onTap: () {
              // ignore: avoid_print
              print('X');
              Navigator.of(context).pop('X 点击关闭');
            },
          );
        });

    // ignore: avoid_print
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["title"]),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _altertDialog();
              },
              child: const Text('altertDialog')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _simpleDialog();
              },
              child: const Text('simpleDialog')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _showModelBottomSheet();
              },
              child: const Text('showModelBottomShe')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _MyDialog_0();
              },
              child: const Text('自定义—MyDialog_0')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _fluttertoast();
              },
              child: const Text('我是第三方fluttertoast')),
        ],
      )),
    );
  }
}

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
