import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 弹性布局
class MyFlex extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyFlex({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyFlex({
    super.key,
  });

  @override
  State<MyFlex> createState() => _MyFlexState();
}

class _MyFlexState extends State<MyFlex> {
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
          Container(
            width: 600,
            height: 200,
            color: Colors.green,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blueGrey,
                    height: 180,
                    child: Image.asset(
                      'images/tab_flag_pre.png',
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.blue,
                    height: 180,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'images/tab_flag_pre.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'images/tab_flag_pre.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
