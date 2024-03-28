import 'package:flutter/material.dart';
import 'package:flutter01/12_Scaffold.dart';

//// 统一管理页面跳转 Router
import 'package:flutter01/14_Navigator/14_News.dart';
import 'package:flutter01/14_Navigator/14_Search.dart';
import 'package:flutter01/15_Dialog.dart';
import 'package:flutter01/16_PageView.dart';
import 'package:flutter01/16_PageView/16_PageViewKeepAlive.dart';
import 'package:flutter01/17_Key.dart';
import 'package:flutter01/18_AnimatedList.dart';
import 'package:flutter01/19_Animated.dart';
import 'package:flutter01/20_AnimatedHero.dart';

/// 1、配置路由
final Map routes = {
  "/": (context) => const MyScaffold0(),
  "/news": (context, {arguments}) => NewsPage0(arguments: arguments),
  "/search": (context) => const SearchPage0(title: "SearchPage"),
  "/dialog": (context, {arguments}) => MyDialog0(arguments: arguments),
  "/pageView": (context, {arguments}) => MyPageView0(arguments: arguments),
  "/pageViewKeepAlive": (context, {arguments}) =>
      MyPageViewKeepalive(arguments: arguments),
  "/key": (context, {arguments}) => MyKey0(arguments: arguments),
  "/animatedList": (context, {arguments}) =>
      MyAnimatedList0(arguments: arguments),
  "/animated": (context, {arguments}) => MyAnimated0(arguments: arguments),
  "/animatedHero": (context, {arguments}) =>
      MyAnimatedHero0(arguments: arguments),
  "/hero": (context, {arguments}) => MyHero0(arguments: arguments),
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
