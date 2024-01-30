// 自定义对象

class TsPerson {

  // String name = 'name';
  // int age = 0;

  void getInfo() {
    print('name == $kk ' + 'age==$_hh');
  }
  /// 用'_'进行方法、属性私有化 需这个类是单独的一个文件、不再统一文件内
   
  // 默认构造函数
  String kk='';
  int _hh=0;
  TsPerson(String kk, _hh) {
    this.kk = kk;
    this._hh = _hh;
  }

  String test='test';
  static String jt = '静态属性';

  /// 简写
  //Person(this.kk, this.hh);

}

/// 继承 TsPerson\需要=实现默认构造函数
class Web111 extends TsPerson {
  Web111(super.kk, super.hh);

  @override String test='c重写';
    

}


/// 抽象类方法等\继承他的子类必须有eat(); 方法 、约束子类(类似siwft 协议这些)
abstract class  Animal1 {
  eat(); // 抽象方法的作用
}
abstract class  Animal2 {
  run(); // 抽象方法的作用
}

class Dog extends Animal1 { 
  @override
  eat() {
    // TODO: implement eat
    // throw UnimplementedError();
    print('eat');
  }

}

/// 多接口实现、方法等 mixins 只能继承 object 不能是其他类
class Muse1 implements Animal1, Animal2 { 
  @override
  eat() {
    // TODO: implement eat
    // throw UnimplementedError();
    print('eat');
  }
  
  @override
  run() {
    // TODO: implement run
   // throw UnimplementedError();
    print('run');
  }

}
