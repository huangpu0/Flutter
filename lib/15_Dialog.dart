// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import './15_Dialog/15_MyDialog.dart';

/// 命名路由传值
class MyDialog0 extends StatefulWidget {
  final Map arguments;
  const MyDialog0({super.key, required this.arguments});

  @override
  State<MyDialog0> createState() => _MyDialog0State();
}

class _MyDialog0State extends State<MyDialog0> {
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
  void _toast() {}

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
        // ignore: unnecessary_string_interpolations
        title: Text('${widget.arguments["title"].toString()}'),
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
        ],
      )),
    );
  }
}
