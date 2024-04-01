import 'libs/TsPerson.dart';

void main(List<String> args) {
  /**
   * 格式
   * 返回类型 方法名(参数1,参数2,.......) {
   * 方法体
   * return 返回值;
   * }
   */

  var kk_num = get_Number();
  print(kk_num);
  var ss_str = out_data('s1');
  print(ss_str);

  // 泛型方法
  print(getdata('字符串===21'));
  var t1 = getdata(21);
  print('int类型====$t1');
  // 泛型方法制定类型
  print(getdata<String>('字符串呀'));

  /// 箭头函数
  List list = [4, 1, 2, 3, 4];
  var new_list = list.map((e) => e > 2 ? e * 2 : e);
  print(new_list.toList());

  /// 实例化
  var p = new Person('zhang', 20);
  print(p.kk);
  p.getInfo();

  var p1 = new TsPerson('zhang', 20);
  print(p1.kk);
  p1.getInfo();

  // 静态属性
  print(TsPerson.jt);

  var w1 = new Web111('', 5);
  print(w1.test);
}

// 泛型方法
T getdata<T>(T value) {
  return value;
}

// int 返回值
int get_Number() {
  var kk = 123;
  return kk;
}

//带参 返回值 []可选参数
String out_data(String s1, [int n1 = 0]) {
  if (n1 != 0) {
    return '$s1' + '-' + '$n1';
  }
  return '$s1 ' + '+' + '$n1';
}

// 自定义对象
class Person {
  // String name = 'name';
  // int age = 0;

  void getInfo() {
    print('name == $kk ' + 'age==$hh');
  }

  // 默认构造函数
  String kk = '';
  int hh = 0;
  Person(String kk, int hh) {
    this.kk = kk;
    this.hh = hh;
  }

  /// 简写
  //Person(this.kk, this.hh);
}
