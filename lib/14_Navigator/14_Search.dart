import 'package:flutter/material.dart';
import '../12_Scaffold.dart';

class SearchPage0 extends StatefulWidget {
  final String title;
  const SearchPage0({super.key, required this.title});

  @override
  State<SearchPage0> createState() => _SearchPage0State();
}

class _SearchPage0State extends State<SearchPage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: unnecessary_string_interpolations
          title: Text('${widget.title}'),
        ),
        body: Center(
          child: Column(children: [
            /// 返回根视图
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const MyScaffold0();
                  }), (route) => false);
                },
                child: const Text('返回根视图搜索页面')),
          ]),
        ));
  }
}
