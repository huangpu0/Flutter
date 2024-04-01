import 'package:flutter/material.dart';
import 'Routors/Routers.dart';
import 'package:flutter01/Module_Me/MePage.dart';
import 'package:flutter01/Module_Home/HomePage.dart';
import 'package:flutter01/Module_Message/MessagePage.dart';

void main() {
  runApp(const MainTabBar());
}

// Module入口
class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/main",
      // 命名路由
      //routes: {
      //   "/": (context) => const MyScaffold0(),
      //   "/news": (context) => NewsPage0(
      //         arguments: routes,
      //       ),
      //   "/search": (context) => const SearchPage0(title: "SearchPage"),
      // },
      onGenerateRoute: onGenerateRoute,
    );
  }
}

// 主要Module入口
class MainModule extends StatefulWidget {
  const MainModule({super.key});
  @override
  State<MainModule> createState() => _MainModuleState();
}

class _MainModuleState extends State<MainModule> {
  /// 当前选中位置
  int currentPath = 0;

  /// tabs 页面
  List<Widget> tabBars = const [HomePage(), MessagePage(), MePage()];

  List<BottomNavigationBarItem> modules() {
    List<Icon> icons = const [
      Icon(Icons.home),
      Icon(Icons.message),
      Icon(Icons.face)
    ];
    List<String> names = const ['首页', '消息', '我的'];

    List<BottomNavigationBarItem> tmpList = [];
    for (var i = 0; i < names.length; i++) {
      tmpList.add(BottomNavigationBarItem(icon: icons[i], label: names[i]));
    }
    return tmpList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBars[currentPath],

      /// 自定义底部导航条
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPath,
          unselectedIconTheme: const IconThemeData(color: Colors.black38),
          unselectedItemColor: Colors.black38,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          selectedItemColor: Colors.blue,
          onTap: (value) {
            setState(() {
              currentPath = value;
            });
          },
          items: modules()),

      /// FloatingActionButton 类似咸鱼底部凸起按钮
      floatingActionButton: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(5),

        /// 调整FloatingActionButton位置
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
            backgroundColor: currentPath == 1 ? Colors.red : Colors.blue,
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                currentPath = 1;
              });
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



/// 01_Container_Text
/// MyApp(), MyButton(), MyText()

/// 02_Image
/// MyImage(), Circular(), ClipImage(), LoaclImage()

/// 03_Icon
/// MyIcon()

/// 04_ListView
/// MyListView0(), MyListView1(), MyListView2(),  MyListView3()

/// 05_GridView
/// MyGridView0(), MyGridView1(), 

/// 06_页面布局
/// MyPadding0(), MyRow0(), MyFlex0(),

/// 07_Stack
/// MyStack0(), MyStack1(), 

/// 08_AspectRation
/// MyAspectRation0(), MyAspectRation1(), MyAspectRation2(),

/// 09_Button
/// MyButton0(),

/// 10_Wrap
/// MyWrap0(), MyWrap1(),

/// 11_StatefulWidget
/// MyStatefulWidget0(), MyStatefulWidget1(), 

/// 12_Scaffold 自定义底部导航条(BottomNavigationBar) + 
/// 类似咸鱼底部凸起按钮(FloatingActionButton) + 侧边栏 (Drawer) + 导航栏(AppBar）
/// MyScaffold0(), 

/// 13_AppBar  TabBar、 TabBarView 类似头条头部滑动导航栏
/// MyAppBar0(), 

/// 14_Navigator 统一管理Router 
/// MyNavigator0(), 

/// 15_Dialog 弹窗信息
/// MyDialog0(), 


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
