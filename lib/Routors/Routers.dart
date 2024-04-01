import 'package:flutter/material.dart';
import 'package:flutter01/main.dart';
// HomePage
import 'package:flutter01/Module_Home/01_Container.dart';
import 'package:flutter01/Module_Home/03_Image.dart';
import 'package:flutter01/Module_Home/02_Text.dart';
import 'package:flutter01/Module_Home/04_Icon.dart';
import 'package:flutter01/Module_Home/05_Button.dart';
import 'package:flutter01/Module_Home/06_Scaffold.dart';
import 'package:flutter01/Module_Home/07_AppBar.dart';
import 'package:flutter01/Module_Home/08_Dialog.dart';
import 'package:flutter01/Module_Home/09_Key.dart';
import 'package:flutter01/Module_Home/10_Animated.dart';
import 'package:flutter01/Module_Home/10_List_Animated.dart';
import 'package:flutter01/Module_Home/10_Hero_Animated.dart';
import 'package:flutter01/Module_Home/21_ListView.dart';
// MePage
import 'package:flutter01/Module_Me/01_Padding.dart';
import 'package:flutter01/Module_Me/02_Row_Column.dart';
import 'package:flutter01/Module_Me/03_Flex.dart';
import 'package:flutter01/Module_Me/04_Stack.dart';
import 'package:flutter01/Module_Me/05_Wrap.dart';
import 'package:flutter01/Module_Me/06_AspectRation.dart';

/// 1、配置路由
final Map routes = {
  '/main': (context) => const MainModule(),
  // HomePage
  '/home_Container': (context, {arguments}) => MyContainer(
        arguments: arguments,
      ),
  '/home_Text': (context, {arguments}) => MyText(arguments: arguments),
  '/home_Image': (context, {arguments}) => MyImage(arguments: arguments),
  '/home_Icon': (context, {arguments}) => MyIcon(arguments: arguments),
  '/home_Button': (context, {arguments}) => MyButton(arguments: arguments),
  '/home_Scaffold': (context, {arguments}) => MyScaffold(arguments: arguments),
  '/home_AppBar': (context, {arguments}) => MyAppBar(arguments: arguments),
  '/home_Dialog': (context, {arguments}) => MyDialog(arguments: arguments),
  '/home_Key': (context, {arguments}) => MyKey(arguments: arguments),
  '/home_Animated': (context, {arguments}) => MyAnimated(arguments: arguments),
  '/home_Ani_show': (context, {arguments}) => MyAnimated0(arguments: arguments),
  '/home_Ani_List': (context, {arguments}) =>
      MyAnimatedList(arguments: arguments),
  '/home_Ani_Hero': (context, {arguments}) =>
      MyAnimatedHero(arguments: arguments),
  "/home_Ani_MyHero": (context, {arguments}) => MyHero(arguments: arguments),

  '/home_ListView': (context, {arguments}) => MyListView0(arguments: arguments),
  '/home_ListView0': (context, {arguments}) =>
      MyListView0(arguments: arguments),
  '/home_ListView1': (context, {arguments}) =>
      MyListView1(arguments: arguments),
  '/home_ListView2': (context, {arguments}) =>
      MyListView2(arguments: arguments),

  // MePage
  '/me_Padding': (context, {arguments}) => MyPadding(arguments: arguments),
  '/me_Row': (context, {arguments}) => MyRow(arguments: arguments),
  '/me_Column': (context, {arguments}) => MyColumn(arguments: arguments),
  '/me_Flex': (context, {arguments}) => MyFlex(arguments: arguments),
  '/me_Stack0': (context, {arguments}) => MyStack0(arguments: arguments),
  '/me_Stack1': (context, {arguments}) => MyStack1(arguments: arguments),
  '/me_Wrap0': (context, {arguments}) => MyWrap0(arguments: arguments),
  '/me_Wrap1': (context, {arguments}) => MyWrap1(arguments: arguments),
  '/me_AspectRation0': (context, {arguments}) =>
      MyAspectRation0(arguments: arguments),
  '/me_AspectRation1': (context, {arguments}) =>
      MyAspectRation1(arguments: arguments),
  '/me_AspectRation2': (context, {arguments}) =>
      MyAspectRation2(arguments: arguments),
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
