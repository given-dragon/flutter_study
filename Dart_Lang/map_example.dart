import 'dart:ffi';

void main() {
  //0.맵선언
  Map<int, String> intMap = {
    0: 'AAA',
    50: 'BBB',
    100: 'CCC',
  };

  //1.맵 기본 사용
  print('intMap is $intMap');
  print('intMap[50] : ${intMap[50]}');
  intMap.update(50, (value) => 'DDD');
  print('intMap[50] : ${intMap[50]}');

  //2.사용자 정의 클래스 활용
  Map<String, Student> students = {
    'jake': Student('jake', 'warton', 'jake@gmail.com'),
    'tony': Student('tony', 'stark', 'tony@gmail.com'),
    'kent': Student('kent', 'beck', 'kent@gmail.com'),
  };

  String fullName =
      students['jake']!.firstName + ' ' + students['jake']!.lastName;
  print('jake\'s full name is $fullName');

  String email = students['kent']!.email;
  print('kent\'s email is $email');
}

class Student {
  String firstName;
  String lastName;
  String email;

  Student(this.firstName, this.lastName, this.email);
}
