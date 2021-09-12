import 'dart:collection';

void main() {
  //0.final //실행중에도 생성 가능!
  final String name = 'yjy';
  //name = 'cant change';

  //1.const  컴파일시 결정되는 상수
  const int STUDENT_MAX = 100;
  const double PIE = 3.14159326;

  //2.static
  print('Queue initial capacity is ${Queue.initialCapacity}');
}

class Queue {
  static const initialCapacity = 12;
}
