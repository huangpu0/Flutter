import 'package:flutter/material.dart';
import '14_Routor/Routers.dart';

class MyNavigator0 extends StatelessWidget {
  const MyNavigator0({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      // 命名路由
      // routes: {
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
