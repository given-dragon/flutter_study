import 'dart:convert';
import 'dart:io';

void main() {
  //0.json 문자열 파싱
  String jsonStr = """
  {"basket" : {
    "apple" : 50,
    "banana" : 10,
    "grape" : 5    
  }
  }
  """;

  Map json = jsonDecode(jsonStr);
  Map basket = json["basket"];
  int apples = basket['apple'];
  int bananas = basket['banana'];
  int grapes = basket['grape'];

  print('apples are $apples');
  print('banana are $bananas');
  print('grape are $grapes');

  //1.json 파일 읽기
  Map basketMap = _readBasketJson('basket.json');
  print('grapes was ${basketMap['grape']}');

  //2.json 파일 쓰기
  basketMap.update('grape', (value) => 99);
  File('basket.json').writeAsStringSync(jsonEncode(basketMap));

  Map updated = _readBasketJson('basket.json');
  int grapesNow = updated['grape'];
  print('now grapes are $grapesNow');
}

Map _readBasketJson(String fileName) {
  String contents = File(fileName).readAsStringSync();
  print('contents : $contents');
  return jsonDecode(contents);
}
