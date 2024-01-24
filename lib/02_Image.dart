import 'package:flutter/material.dart';


// https://foruda.gitee.com/avatar/1676982612219119174/1672875_huangpu0_1578957408.png!avatar200

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        alignment: Alignment.center,
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
        child: Image.network('https://foruda.gitee.com/avatar/1676982612219119174/1672875_huangpu0_1578957408.png!avatar200',
        alignment: Alignment.center,
        fit: BoxFit.cover, // 剪裁充满容器 
        repeat: ImageRepeat.repeatY, // 平铺
        ),
      ));
  }    
}

// 实现一个圆形图片
class Circular extends StatelessWidget {
  const Circular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        alignment: Alignment.center,
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(image: NetworkImage('https://foruda.gitee.com/avatar/1676982612219119174/1672875_huangpu0_1578957408.png!avatar200'
            ),
          fit: BoxFit.cover,
        ),
    ));

  }
}

// 实现一个圆形图片 使用 ClipOva
class ClipImage extends StatelessWidget {
  const ClipImage ({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
         child: Image.network('https://foruda.gitee.com/avatar/1676982612219119174/1672875_huangpu0_1578957408.png!avatar200', 
         width: 100,
         height: 100,
         fit: BoxFit.cover,
         ),
    );

  }
}

// 加载本地图片
class LoaclImage extends StatelessWidget {
  const LoaclImage ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
         width: 100,
         height: 100,
         child: Image.asset('images/tab_flag_pre.png', 
         fit: BoxFit.cover,)
    );

  }
}