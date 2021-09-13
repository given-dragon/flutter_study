void main() {
  //0.집합선언
  Set<int> naturalNumbers = {1, 2, 3, 4, 1}; //내용은 중복이 되지 않음 -> 1,2,3,4임
  Set<String> ids = {'X-3', 'X-2', 'X-1'};

  //1.집합사용
  print('numbers are $naturalNumbers');
  print('ids are $ids'); //not sorted
  //print('first number is ${numbers[0]}'); //not indexed

  for (int each in naturalNumbers) {
    print('each number is $each');
  }

  //Set<int> integers = {0} + naturalNumbers; // + not defined

  //2.수작적 집합의 활용
  Set<int> a = {100, 200, 300};
  Set<int> b = {100, 200, 500, 1000};

  print('a union b = ${a.union(b)}');
  print('a intersection b = ${a.intersection(b)}');
  print('a difference b = ${a.difference(b)}');
}
