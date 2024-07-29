import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class MyHttp extends StatefulWidget {
  const MyHttp({super.key});

  @override
  State<MyHttp> createState() => _MyHttpState();
}

class _MyHttpState extends State<MyHttp> {
   //展示请求结果
  var resultShow = "";

  //请求结果解析
  var resultDecodeShow = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http 的 post 请求"),
      ),
      body: Column(
        children: [
          Center(
            child: _httpGetButton(),
          ),
          //post 请求按钮 - form
          Center(
            child: _httpPostFormButton(),
          ),
          //post 请求按钮 - json
          Center(
            child: _httpPostJsonButton(),
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                '请求结果：\n $resultShow',
                textAlign: TextAlign.left,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                '请求结果（解析）：\n $resultDecodeShow',
                textAlign: TextAlign.left,
              )),
            ],
          ),
        ],
      ),
    );
  }

  //get 按钮
  _httpGetButton() {
    return ElevatedButton(onPressed: _doGet, child: const Text('发起 Get 请求'));
  }

  //post 按钮 - form
  _httpPostFormButton() {
    return ElevatedButton(
        onPressed: _doFormPost, child: const Text('发起 post 请求 - form'));
  }

  //post 按钮 - json
  _httpPostJsonButton() {
    return ElevatedButton(
        onPressed: _doJsonPost, child: const Text('发起 post 请求 - json'));
  }

  // utf8 解码
  _decodeUtf8(String responseBody) {
    var bytes = Uint8List.fromList(responseBody.codeUnits);
    String decodeString = utf8.decode(bytes);
    var decodeMap = json.decode(decodeString);
    return decodeMap;
  }

  //解析结果 json 数据
  String _decodeResult(String jsonString) {
    var map = jsonDecode(jsonString);
    var decodeString = "";
    map.forEach((key, value) {
      decodeString += "key: $key ------ value: $value\n";
    });
    return decodeString;
  }

  //请求成功
  _success(http.Response response, bool isNeedUtf8) {
    setState(() {
      if (isNeedUtf8) {
        //返回结果的汉字用了 utf8 编码，所以需要对结果进行 utf8 解码
        resultShow = '请求成功：${_decodeUtf8(response.body)}';
      } else {
        //返回结果的汉字未用 utf8 编码，所以无需解码
        resultShow = '请求成功：${response.body}';
      }
      resultDecodeShow = _decodeResult(response.body);
    });
  }

  //请求失败
  _failed(http.Response response) {
    setState(() {
      resultShow =
          "请求失败：errorCode: ${response.statusCode}   errorMessage: ${response.body}";
    });
  }

  //发送 Get 请求
  _doGet() async {
    var url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //请求成功
      _success(response, true);
    } else {
      //请求失败
      _failed(response);
    }
  }

  //发送 Post 请求 - form
  _doFormPost() async {
    var url = Uri.parse('http://api.crap.cn/visitor/example/post.do');
    var params = {
      'param': '测试22',
      'email': 'crap.cn@gmail.com',
      '555': '我'
    }; //如果传 Map 类型，必须是 Map<String, String>，否则会解析报错
    var response =
        await http.post(url, body: params); //默认是 form 类型，所以无需设置 content - type
    if (response.statusCode == 200) {
      //请求成功
      _success(response, false);
    } else {
      //请求失败
      _failed(response);
    }
  }

  //发送 Post 请求 - json
  _doJsonPost() async {
    var url = Uri.parse('http://api.crap.cn/visitor/example/json.do');
    var params = {
      "id": "8989-dddvdg",
      "name": "文章标题-JSON格式参数演示",
      "brief": "快速入门json参数",
      "category": "分类"
    };
    var json = jsonEncode(params);
    var response = await http.post(url, body: json, headers: {
      'content-type': 'application/json'
    }); //设置content-type为application/json
    if (response.statusCode == 200) {
      //请求成功
      _success(response, false);
    } else {
      //请求失败
      _failed(response);
    }
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

 