/// async 方法异步、 await 等待异步方法执行完成
/// 1、Pub 包管理系统
/// 2、新建 pubspec.yaml
/// 3、name: xxx
// description: A new Flutter module peojiect
// dependencies:
//   http: ^1.2.0
/// 4、put get 获取远程 http 库
/// 
/// 库的重命名
/// import 'libs/TsPerson.dart' as lib;
/// show 部分引入、只用部分功能、 hide隐藏某些功能


void main(List<String> args) {
  testdemo();
}

/// 方法异步
void testdemo() async {
   print('异步方法');
}