import 'package:flutter/material.dart';

/// 命名路由传值
class NewsPage0 extends StatefulWidget {
  final Map arguments;
  const NewsPage0({super.key, required this.arguments});

  @override
  State<NewsPage0> createState() => _NewsPage0State();
}

class _NewsPage0State extends State<NewsPage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        title: Text('${widget.arguments["title"].toString()}'),
      ),
      body: Center(
        child: Text('命名路由传值News页面 ==参数==  \n ${widget.arguments}'),
      ),
    );
  }
}
