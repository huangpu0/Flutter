/// 变量、常量
void demo02() {
  /// 字符串
  var str='字符串';
  str='''  
有点类似swift 写法
123
''';
  print(str);
   
  var str2='tets';
  print('$str $str2');

  print(str + str2);

  /// int 
  var mynum=1234;
  print(mynum);
   
  /// 常量 const \ final (开始可以不赋值，只能赋值一次)
  /// 常量共享内存空间、var 不是    
  const kk='llllll';
  print(kk);

  ///? 可空类型
  String? s1 = 's1';
  s1 = null;
  print(s1);

}