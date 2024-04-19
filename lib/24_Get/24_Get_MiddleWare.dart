import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeGetMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // return null; // 不做任何操作
    // 控制跳转指定路由页面
    return const RouteSettings(
        name: '/home_Get_Mid_Home',
        arguments: {'title': 'Get路由跳转中间件', 'data': 'Get路由参数Mid'});
  }
}
