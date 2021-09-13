import 'dart:io';

void main() {
  //0.파일 생성
  File newFile = File('temp_file.text');
  newFile.createSync();

  //1.파일 읽기(동기방식)
  File poem = File('poem.txt');
  List<String> lines = poem.readAsLinesSync();
  for (String line in lines) {
    print(line);
  }

  //2.파일 쓰기(동기방식)
  File memoFile = File('diary.txt');
  String contents = '''
  2021.09.13: 오늘도 플러터 공부중~~
  어제 오늘 플러터에 쓰이는 Dart언어 문법을 공부중입니다.
  얼른 빨리 플러터 잘 다루고싶음~~~
  ''';

  memoFile.writeAsStringSync(contents);
}
