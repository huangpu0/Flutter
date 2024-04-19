import 'package:flutter/material.dart';
import 'package:flutter01/Module_Home/HomePageItem.dart';
import 'package:get/get.dart';

class MyGetX extends StatefulWidget {
  // 1、原生路由接收数据
  // final Map arguments;
  // const MyGetX({super.key, required this.arguments});
  // 2、Get方式路由 不需要 arguments 参数、可通过 Get.arguments 获取参数
  const MyGetX({
    super.key,
  });

  @override
  State<MyGetX> createState() => _MyGetXState();
}

class _MyGetXState extends State<MyGetX> {
  List<Widget> _getListData() {
    var dataSource = [
      {
        'title': '1、Flutter默认Dialog',
        'type': 1,
      },
      {
        'title': '1、Get默认Dialog',
        'type': 2,
      },
      {
        'title': '2、Get - snackbar',
        'type': 3,
      },
      {
        'title': '3、Get - bottomSheet切换主题',
        'type': 4,
      },
      {
        'title': '4、Get - 路由方式跳转+参数',
        'type': 5,
      },
      {
        'title': '5、Get - 中间件、路由拦截、响应式状态管理',
        'type': 6,
      },
      {
        'title': '6、Get - 多页面数据共享',
        'type': 7,
      },
    ];
    Iterable<Widget> wlist = dataSource.map((e) {
      return GestureDetector(
        onTap: () {
          var type = e['type'];
          switch (type) {
            case 1: // 1、Flutter默认Dialog
              _altertDialog();
            case 2: // 1、Get默认Dialog
              _getDialog();
            case 3: // 2、Get - snackbar
              _snackbar();
            case 4: // 3、Get - bottomSheet切换主题
              _bottomSheet();
            case 5: // 4、Get - 路由方式跳转
              _getRouter();
            case 6: // 5、Get - 中间件、路由拦截、响应式状态管理
              _getRouterMid();
            case 7: // 6、Get - 多页面数据共享
              _getMorePageData();
            default:
              break;
          }
        },
        child: HomePageItem(
          title: e['title'].toString(),
        ),
      );
    });
    return wlist.toList();
  }

  // 1、Flutter默认Dialog
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

  // 1、Get默认Dialog
  void _getDialog() {
    Get.defaultDialog(
      title: '我是Get-Dialog',
      middleText: '确定要删除吗？',
      confirm: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pop();
            Get.back();
          },
          child: const Text('确定')),
      cancel: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('取消')),
    );
  }

  // 2、Get - snackbar
  void _snackbar() {
    Get.snackbar('提示', '您还没有登陆', snackPosition: SnackPosition.BOTTOM);
  }

  // 3、bottomSheet切换主题
  void _bottomSheet() {
    Get.bottomSheet(Container(
      color: Get.isDarkMode ? Colors.black26 : Colors.white,
      height: 200,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.wb_sunny_outlined,
              color: Get.isDarkMode ? Colors.white : Colors.black87,
            ),
            onTap: () {
              // 切换主题
              Get.changeTheme(ThemeData.light());
            },
            title: Text(
              '白天模式',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.wb_sunny,
              color: Get.isDarkMode ? Colors.white : Colors.black87,
            ),
            onTap: () {
              Get.changeTheme(ThemeData.dark());
            },
            title: Text(
              '黑夜模式',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          )
        ],
      ),
    ));
  }

  // 4、路由方式跳转
  void _getRouter() {
    Get.toNamed('/home_Get_home',
        arguments: {'title': 'Get路由跳转', 'data': 'Get路由参数'});
  }

  // 5、6、中间件、路由拦截 状态管理
  void _getRouterMid() {
    Get.toNamed('/home_Get_Mid',
        arguments: {'title': 'Get路由跳转中间件', 'data': 'Get路由参数'});
  }

  // 7、多页面数据共享
  void _getMorePageData() {
    Get.toNamed('/home_Get_Mid',
        arguments: {'title': 'Get路由跳转中间件', 'data': 'Get路由参数更多数据'});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          // 1、原生路由接收数据
          //title: Text(widget.arguments["title"]),
          // 2、Get方式路由跳转接收数据
          title: Text(Get.arguments['title']),
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
