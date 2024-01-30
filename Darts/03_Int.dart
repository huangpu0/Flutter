void main(List<String> args) {

  //1、int
  int a=123;
  print('$a');

  //2、double 值即可是浮点、又可是整形（例：24.0）
  double b=23.5;
  print('$b');

  //3、运算符
  var c=a*b;
  print('$c');

  // bool
  bool flag=false;
  print(flag);
  // 条件判断
  // ignore: dead_code
  if (!flag) {
    print('true1111');
  // ignore: dead_code
  } else {
    print('flase1111');
  }

}