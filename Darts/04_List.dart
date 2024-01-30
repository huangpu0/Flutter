void main(List<String> args) {
  // list
  var list1 = ['test', 123, true];
  print(list1);
  list1.forEach((element) {
    print(element);
  });
  for (int i = 0; i < list1.length; i++) {
    var kk = list1[i];
    print('$kk' + '123');
  }
  ;

  list1.removeAt(0);
  list1.insert(0, "test");
  list1.add('wer');
  list1.addAll(['t1','t2']);
  print(list1);

  // 指定类型
  var list2 = <String>['1', 'w', 'c'];
  list2.fillRange(1,2,'123');
  print(list2);

  var nv_2 = list2.where((element) {
    return element == '123';
  });
  print('nv2 $nv_2');

  // List 这种方式集合长度固定、不可修改
  var list3 = List.filled(2, "");
  list3[0] = '1122';
  list3[1] = 'tets11';
  print(list3);

  /// Map
  mapdemo();

  /// is 类型判断
  is_type_demo();
}

void mapdemo() {
  var dict = {
    'name': 'test123',
    'age': 20,
    'work': ['程序员', '外卖员']
  };
  print(dict);
  dict['height'] = 1.08;
  print(dict);
  print(dict['work']);

  /// 初始化
  var map = new Map();
  map['k1'] = '112';
  map['k2'] = '456';
  print(map);
}

/// 类型判断 is 转换
void is_type_demo() {
  var dict = {
    'name': 'test123',
    'age': 20,
    'work': ['程序员12', '外卖员12']
  };
  print(dict);
  if (dict['work'] is List) {
    print(dict['work']);
  }

  // String 转 Number
  String a1 = "123";
  var num1 = int.parse(a1);
  print(num1);

  /// 异常处理
  try {
    //var num1 = int.parse(a1);
  } catch (e) {
    print(e.toString());
  }

  var a2 = num1.toString();
  print(a2);

  // while \ do while
  int i = 1;
  var sum = 0;
  while (i <= 100) {
    sum += i;
    i++;
  }
  print(sum);

  int i11 = 1;
  var sum11 = 0;
  do {
    sum11 += i11;
    i11++;
  } while (i11 <= 100);
  print(sum11);

  // continue 跳过当前循环体剩下继续执行、 break 结束剩下不再执行

  for (int i = 0; i < 10; i++) {
    if (i == 4) {
      continue;
    }
   print('ssss=1=$i');
    if (i == 6) {
      break;
    }
    print('ssss=2=$i');
  }

}
