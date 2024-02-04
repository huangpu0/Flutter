import 'package:flutter/material.dart';

/// 有状态的组件、改变页面数据用这个
class MyStatefulWidget0 extends StatefulWidget {
  const MyStatefulWidget0({super.key});

  @override
  State<MyStatefulWidget0> createState() => _MyStatefulWidget0State();
}

class _MyStatefulWidget0State extends State<MyStatefulWidget0> {
  /// count ++
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text('增加+'))
        ],
      ),
    );
  }
}

/// 有状态的组件、改变页面数据用这个
class MyStatefulWidget1 extends StatefulWidget {
  const MyStatefulWidget1({super.key});

  @override
  State<MyStatefulWidget1> createState() => _MyStatefulWidget1State();
}

class _MyStatefulWidget1State extends State<MyStatefulWidget1> {
  /// 新增数据
  List<String> addListData = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 50),
          children: addListData.map((e) {
            return ListTile(
              title: Text(e),
            );
          }).toList(),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.amberAccent,
            height: 50,
            padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    addListData.add('我是add列表');
                  });
                },
                child: const Text('增加+')),
          ),
        ),
      ],
    );
  }
}


// 静态页面不会改变数据
// class MyStatefulWidget0 extends StatelessWidget {
//   /// count ++
//   int count = 0;

//   MyStatefulWidget0({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('$count'),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   count++;
//                 },
//                 child: const Text('增加+'))
//           ],
//         ),
//       ),
//     );
//   }
// }
