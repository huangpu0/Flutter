import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHttp extends StatefulWidget {
  const MyHttp({super.key});

  @override
  State<MyHttp> createState() => _MyHttpState();
}

class _MyHttpState extends State<MyHttp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 1、原生路由接收数据
        //title: Text(widget.arguments["title"]),
        // 2、Get方式路由跳转接收数据
        title: Text(Get.arguments['title']),
      ),
      body: ListView(
        children: [
          FutureBuilder<String>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.requireData);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },),
          const ListTile(
            title: Text('get'),
          ),
          FutureBuilder<String>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> userMap = jsonDecode(snapshot.requireData);
                return Text(userMap["userId"].toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },),
        ],
      ),
    );
  }
}


Future<String> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load post');
    }
  }