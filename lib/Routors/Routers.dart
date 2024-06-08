// APP Main入口
import 'package:flutter01/07_AppBar/07_home.dart';
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
import 'package:flutter01/Module_Home/22_GridView.dart';
import 'package:flutter01/Module_Home/23_PageView.dart';
import 'package:flutter01/23_PageView/23_PageViewKeepAlive.dart';
import 'package:flutter01/Module_Home/24_Get.dart';
import 'package:flutter01/24_Get/24_Get_Home.dart';
import 'package:flutter01/24_Get/24_Get_Mid_Home.dart';
import 'package:flutter01/24_Get/24_Get_MiddleWare.dart';

// MePage
import 'package:flutter01/Module_Me/01_Padding.dart';
import 'package:flutter01/Module_Me/02_Row_Column.dart';
import 'package:flutter01/Module_Me/03_Flex.dart';
import 'package:flutter01/Module_Me/04_Stack.dart';
import 'package:flutter01/Module_Me/05_Wrap.dart';
import 'package:flutter01/Module_Me/06_AspectRation.dart';
// Get 方式路由
import 'package:get/get.dart';

// Get方式路由
final List<GetPage> getPages = [
  GetPage(name: '/main', page: () => const MainModule()),
  // HomePage
  GetPage(name: '/home_Container', page: () => const MyContainer()),
  GetPage(name: '/home_Text', page: () => const MyText()),
  GetPage(name: '/home_Image', page: () => const MyImage()),
  GetPage(name: '/home_Icon', page: () => const MyIcon()),
  GetPage(name: '/home_Button', page: () => const MyButton()),
  GetPage(name: '/home_Scaffold', page: () => const MyScaffold()),
  GetPage(name: '/home_AppBar', page: () => const MyAppBar()),
  GetPage(name: '/home_Dialog', page: () => const MyDialog()),
  GetPage(name: '/home_Key', page: () => const MyKey()),
  GetPage(name: '/home_Animated', page: () => const MyAnimated()),
  GetPage(name: '/home_Ani_Show', page: () => const MyAnimated0()),
  GetPage(name: '/home_Ani_List', page: () => const MyAnimatedList()),
  GetPage(name: '/home_Ani_Hero', page: () => const MyAnimatedHero()),
  GetPage(name: '/home_Ani_MyHero', page: () => const MyHero()),
  GetPage(name: '/home_ListView', page: () => const MyListView()),
  GetPage(name: '/home_ListView_Show', page: () => const MyListView0()),
  GetPage(name: '/home_GridView', page: () => const MyGridView()),
  GetPage(name: '/home_GridView_Show', page: () => const MyGridView0()),
  GetPage(name: '/home_PageView', page: () => const MyPageView()),
  GetPage(name: '/home_PageView_Show', page: () => const MyPageView0()),
  GetPage(
      name: '/home_PageView_KeepAlive',
      page: () => const MyPageViewKeepalive()),
  GetPage(name: '/home_Get', page: () => const MyGetX()),
  GetPage(
    name: '/home_Get_home',
    page: () => const MyHome24(),
  ),
  GetPage(
      name: '/home_Get_Mid',
      page: () => const MyHome24(),
      middlewares: [HomeGetMiddleWare()]),
  GetPage(name: '/home_Get_Mid_Home', page: () => const MyHomeMid24()),

  // MePage
  GetPage(name: '/me_Padding', page: () => const MyPadding()),
  GetPage(name: '/me_Row', page: () => const MyRow()),
  GetPage(name: '/me_Column', page: () => const MyColumn()),
  GetPage(name: '/me_Flex', page: () => const MyFlex()),
  GetPage(name: '/me_Stack0', page: () => const MyStack0()),
  GetPage(name: '/me_Stack1', page: () => const MyStack1()),
  GetPage(name: '/me_Wrap0', page: () => const MyWrap0()),
  GetPage(name: '/me_Wrap1', page: () => const MyWrap1()),
  GetPage(name: '/me_AspectRation0', page: () => const MyAspectRation0()),
  GetPage(name: '/me_AspectRation1', page: () => const MyAspectRation1()),
  GetPage(name: '/me_AspectRation2', page: () => const MyAspectRation2()),
];

/// 1、配置路由
// final Map routes = {
//   '/main': (context) => const MainModule(),
//   // HomePage
//   '/home_Container': (context, {arguments}) => MyContainer(
//         arguments: arguments,
//       ),
//   '/home_Text': (context, {arguments}) => MyText(arguments: arguments),
//   '/home_Image': (context, {arguments}) => MyImage(arguments: arguments),
//   '/home_Icon': (context, {arguments}) => MyIcon(arguments: arguments),
//   '/home_Button': (context, {arguments}) => MyButton(arguments: arguments),
//   '/home_Scaffold': (context, {arguments}) => MyScaffold(arguments: arguments),
//   '/home_AppBar': (context, {arguments}) => MyAppBar(arguments: arguments),
//   '/home_Dialog': (context, {arguments}) => MyDialog(arguments: arguments),
//   '/home_Key': (context, {arguments}) => MyKey(arguments: arguments),
//   '/home_Animated': (context, {arguments}) => MyAnimated(arguments: arguments),
//   '/home_Ani_Show': (context, {arguments}) => MyAnimated0(arguments: arguments),
//   '/home_Ani_List': (context, {arguments}) =>
//       MyAnimatedList(arguments: arguments),
//   '/home_Ani_Hero': (context, {arguments}) =>
//       MyAnimatedHero(arguments: arguments),
//   '/home_Ani_MyHero': (context, {arguments}) => MyHero(arguments: arguments),
//   '/home_ListView': (context, {arguments}) => MyListView(arguments: arguments),
//   '/home_ListView_Show': (context, {arguments}) =>
//       MyListView0(arguments: arguments),
//   '/home_GridView': (context, {arguments}) => MyGridView(arguments: arguments),
//   '/home_GridView_Show': (context, {arguments}) =>
//       MyGridView0(arguments: arguments),
//   '/home_PageView': (context, {arguments}) => MyPageView(arguments: arguments),
//   '/home_PageView_Show': (context, {arguments}) =>
//       MyPageView0(arguments: arguments),
//   '/home_PageView_KeepAlive': (context, {arguments}) =>
//       MyPageViewKeepalive(arguments: arguments),
//   '/home_Get': (context, {arguments}) => MyGetX(arguments: arguments),

//   // MePage
//   '/me_Padding': (context, {arguments}) => MyPadding(arguments: arguments),
//   '/me_Row': (context, {arguments}) => MyRow(arguments: arguments),
//   '/me_Column': (context, {arguments}) => MyColumn(arguments: arguments),
//   '/me_Flex': (context, {arguments}) => MyFlex(arguments: arguments),
//   '/me_Stack0': (context, {arguments}) => MyStack0(arguments: arguments),
//   '/me_Stack1': (context, {arguments}) => MyStack1(arguments: arguments),
//   '/me_Wrap0': (context, {arguments}) => MyWrap0(arguments: arguments),
//   '/me_Wrap1': (context, {arguments}) => MyWrap1(arguments: arguments),
//   '/me_AspectRation0': (context, {arguments}) =>
//       MyAspectRation0(arguments: arguments),
//   '/me_AspectRation1': (context, {arguments}) =>
//       MyAspectRation1(arguments: arguments),
//   '/me_AspectRation2': (context, {arguments}) =>
//       MyAspectRation2(arguments: arguments),
// };

// /// 2、配置onGenerateRoute 固定写法
// var onGenerateRoute = (RouteSettings settings) {
//   // ignore: avoid_print
//   print('settings == $settings');
//   // ignore: avoid_print
//   print('settings.name == ${settings.name}');
//   // ignore: avoid_print
//   print('settings.arguments == ${settings.arguments}');

//   final String? name = settings.name;
//   final Function? pageContentBuilder = routes[name];
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       final Route route = MaterialPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       final Route route =
//           MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
//   return null;
// };
