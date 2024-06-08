import 'dart:async';
import 'package:flutter/material.dart';

class CycleAdView extends StatefulWidget {
  final double width;
  final double height;
  final List<String> list;
  const CycleAdView(
      {super.key,
      this.width = double.infinity,
      this.height = 200,
      required this.list});

  @override
  State<CycleAdView> createState() => _CycleAdViewState();
}

class _CycleAdViewState extends State<CycleAdView> {
  /// 封装轮播图
  int _currentIndex = 0;
  List<Widget> pageList = [];
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    /// 数据源
    for (var i = 0; i < widget.list.length; i++) {
      pageList.add(CycleAdImage(
        asset: widget.list[i],
        width: widget.width,
        height: widget.height,
      ));
    }

    /// Page Controller
    _pageController = PageController(initialPage: 0);

    /// 创建定时器 3s执行一次
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _pageController.animateToPage((_currentIndex + 1) % pageList.length,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  /// 页面销毁使用
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index % pageList.length;
                });
              },
              itemCount: 1000,
              itemBuilder: (context, index) {
                return pageList[index % pageList.length];
              }),
        ),
        Positioned(
            left: 0,
            bottom: 2,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.list.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index ? Colors.blue : Colors.grey),
                );
              }).toList(),
            ))
      ],
    );
  }
}

class CycleAdImage extends StatelessWidget {
  final double width;
  final double height;
  final String asset;
  const CycleAdImage(
      {super.key,
      this.width = double.infinity,
      this.height = 200,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
      ),
    );
  }
}
