void main(List<String> args) {

 ///算数运算符
 /// +-*/  ～/(取整)、%（取余）
 int a = 13;
 int b = 5; 
 print(a~/b);
 print(a%b);

 // ??= 如果其值为空赋值给他 类似 swift ??
 var c1;
 c1??=100;
 print(c1);
 
 switch (a) {
   case 12:
     print(a);
     break;
   default: break;
 }

/// ?? 类似 swift ?? 
var a1;
var b1=a1 ?? 10;
print(b1);


 
}