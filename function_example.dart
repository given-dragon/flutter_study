void main() {
  //0.함수 호출
  int a = 100;
  int b = 200;
  int c = _getBigger(a, b);
  print('bigger num is $c');

  //1.중복호출
  String str = 'apple';
  String addBrace = addSuffix(addPrefix(str, '('), ')');
  print(addBrace);

  //2.선택인자(positional optional parameter)
  int num1 = 100;
  int num2 = addNumber(100);
  int num3 = addNumber(num1, 20);
  print('num1=$num1, num2=$num2, num3=n$num3');

  //3.이름 있는 인자(named optional parameter)
  String http1 = getHttp('http://naver.com', port: 80);
  String http2 = getHttp('http://naver.com');
  print(http1);
  print(http2);
}

int _getBigger(int a, int b) {
  if (a > b) return a;
  return b;
}

String addSuffix(String str, String suffix) => '$str $suffix';
String addPrefix(String str, String prefix) => '$prefix $str';

int addNumber(int num, [int inc = 1]) => num + inc;

String getHttp(String url, {int port = 8000}) {
  return 'get http from $url, port = $port';
}//중괄호에 들어있는 값을 맵 형식으로 넣어주어야함, 함수 사용시 넣어도, 안넣어도 상관없음

