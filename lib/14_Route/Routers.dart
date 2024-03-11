import 'package:flutter/material.dart';
import 'package:flutter01/12_Scaffold.dart';

//// 统一管理页面跳转 Router
import 'package:flutter01/14_Navigator/14_News.dart';
import 'package:flutter01/14_Navigator/14_Search.dart';

/// 1、配置路由
final Map routes = {
  "/": (context) => const MyScaffold0(),
  "/news": (context, {arguments}) => NewsPage0(arguments: arguments),
  "/search": (context) => const SearchPage0(title: "SearchPage"),
};

/// 2、配置onGenerateRoute 固定写法
var onGenerateRoute = (RouteSettings settings) {
  // ignore: avoid_print
  print('settings == $settings');
  // ignore: avoid_print
  print('settings.name == ${settings.name}');
  // ignore: avoid_print
  print('settings.arguments == ${settings.arguments}');

  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
