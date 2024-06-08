import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyButton({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyButton({
    super.key,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1、原生路由接收数据
        //title: Text(widget.arguments["title"]),
        // 2、Get方式路由跳转接收数据
        title: Text(Get.arguments['title']),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('普通按钮');
                  },
                  child: const Text('普通按钮')),
              TextButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('文本按钮');
                  },
                  child: const Text('文字按钮')),
              const OutlinedButton(onPressed: null, child: Text('带边框按钮')),
              IconButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Icon按钮');
                  },
                  icon: const Icon(Icons.thumb_up)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    // ignore: avoid_print
                    print('文字图片1');
                  },
                  icon: const Icon(Icons.safety_check),
                  label: const Text('文字图片1')),
              TextButton.icon(
                  onPressed: () {
                    // ignore: avoid_print
                    print('文字图片2');
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('文字图片2')),
              OutlinedButton.icon(
                  onPressed: () {
                    // ignore: avoid_print
                    print('文字图片3');
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('文字图片3')),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    // ignore: avoid_print
                    print('文字图片背景颜色');
                  },
                  icon: const Icon(Icons.safety_check),
                  label: const Text('文字图片背景颜色')),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: 40,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        // ignore: avoid_print
                        print('按钮哈哈');
                      },
                      child: const Text('按钮哈哈'),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // ignore: avoid_print
                    print('圆角');
                  },
                  child: const Text('圆角'),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    CircleBorder(
                      side: BorderSide(color: Colors.orange, width: 5),
                    ),
                  ),
                ),
                onPressed: () {
                  // ignore: avoid_print
                  print('圆形');
                },
                child: const Text('圆形'),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  style: const ButtonStyle(side: MaterialStatePropertyAll(

                      /// 修改边框的颜色
                      BorderSide(width: 1, color: Colors.red))),
                  onPressed: () {},
                  child: const Text('带边框按钮')),
            ],
          ),
        ],
      ),
    );
  }
}
