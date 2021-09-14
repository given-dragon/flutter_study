// ignore_for_file: file_names

void main() {
  //1.주석
  /*
  여러줄
  */

  ///
  ///여러줄
  ///

  //한줄

  //2.변수선언, 출력
  int inum = 100;
  double dnum = 3.14;
  num nnum1 = 100;
  num nnum2 = 3.14;

  double sum1 = inum + dnum;
  //int sum2 = inum + dnum; => 안됌

  print(sum1);
  num sum3 = nnum1 * nnum2;
  print(sum3);

  //3.문자열  dart에서는 문자열 ''를 권장한다함.
  String text = 'This is Dart lang practice';
  String myName = 'Yi JoonYong';
  String hello = 'Hello $myName';

  print(text.substring(0, 13));
  //print(text.substring(1)); => his is Dart~~~~
  print(hello);

  String str1 = 'google';
  String str2 = 'flutter';
  String str3 = str1 + ' ' + str2;
  int len = str3.length;
  print(str3 + '=> length: $len');

  //4.변수들
  int temp0 = 0; //정수형
  double temp1 = 0.0; //실수형
  num temp2 = 0; //int와 double의 상위타입

  bool temp3 = true; //true or false
  bool a = true;
  bool b = false;
  temp3 = a && b; //and연산
  print('a&&b = $temp3');

  String temp4 = ''; //문자열

  var temp5 = 0; //동적변수이지만 한번 선언 후 다른 타입으로 변경 불가능(초기화를 해주지 않으면 dynamic처럼 가능)
  dynamic temp6; //다른 타입으로 변경 가능

  List temp7; //리스트, Dart에 배열은 없음
  Set temp8; //집합
  Map temp9; //맵
}
