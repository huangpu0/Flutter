import 'package:flutter/material.dart';
import 'res/listData.dart';

class MyGridView0 extends StatelessWidget {
  const MyGridView0({super.key});

  List<Widget> initGridData0() {
    List<Widget> tmpList = [];
    for (var i = 0; i < 12; i++) {
      tmpList.add(Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('这是第--$i--个数据'),
      ));
    }
    return tmpList;
  }

  List<Widget> initGridData1() {
    var tmpList = listData.map((e) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.blue,
            )),
        child: Column(
          children: [
            Image.asset(e['image']),
            const SizedBox(
              height: 10,
            ),
            Text(
              e["title"],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
    });
    return tmpList.toList();
  }

  @override
  Widget build(BuildContext context) {
    /// GridView.count crossAxisCount: 3, /// 一 行显示多少个
    /// GridView.extent maxCrossAxisExtent: 120, /// 横轴子元素最大长度

    return GridView.count(
      padding: const EdgeInsets.all(10), // 间距
      /// 一 行显示多少个
      crossAxisCount: 3,

      /// 水平间距
      crossAxisSpacing: 10,

      /// 垂直间距
      mainAxisSpacing: 10,

      /// 子元素宽高比例
      childAspectRatio: 0.7,

      children: initGridData1(),
    );
  }
}

/// builder 形式动态加载列表
class MyGridView1 extends StatelessWidget {
  const MyGridView1({super.key});

  Widget initGridData0(context, index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
          )),
      child: Column(
        children: [
          Image.asset(listData[index]['image']),
          const SizedBox(
            height: 10,
          ),
          Text(
            listData[index]["title"],
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10), // 间距
      itemCount: listData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        /// 一 行显示多少个
        crossAxisCount: 3,

        /// 水平间距
        crossAxisSpacing: 10,

        /// 垂直间距
        mainAxisSpacing: 10,

        /// 子元素宽高比例
        childAspectRatio: 0.7,
      ),

      itemBuilder: initGridData0,
    );
  }
}
