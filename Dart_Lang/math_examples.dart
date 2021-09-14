import 'dart:math';

void main() {
  List<int> numbers = [100, 200, 300, 400, 250];

  //0.최댓값, 최솟값
  int maxValue = max(numbers[0], numbers[1]);
  int minValue = min(numbers[2], numbers[3]);
  print('max : $maxValue');
  print('min : $minValue');

  //1.제곱근
  double squareRooted = sqrt(numbers[4]);
  print(squareRooted);

  //2.난수발생
  List<int> randomNumbers = _makeRandomNumbers(10, 8);
  print('random number(0..9) is $randomNumbers');

  //3.반올림은 math 패키지가 아님
  double doubleValue = 500.51;
  int rounded = doubleValue.round();
  print('500.51 rounds $rounded');
}

List<int> _makeRandomNumbers(int max, int counts) {
  Random rand = Random();
  List<int> res = [];

  for (int i = 0; i < counts; i++) {
    res.add(rand.nextInt(max));
  }
  return res;
}
