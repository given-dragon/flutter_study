import 'dart:ffi';

import 'atm_v1.dart';

void main() {
  //0.할당, 산술연산자
  int num = 99;
  num += 1;
  print('num = $num');

  //1.관계 연산자
  const double pie = 3.14;
  if (pie >= 3.14) {
    print('pie는 3.14 이상입니다.');
  }

  //2.논리 연산자
  const String password = '1234';
  String _input = "12345";
  if (_input == password) {
    print('로그인 성공');
  } else {
    print('로그인 실패');
  }

  String _nextInput = '1234';
  String _loginResult = password == _nextInput ? '로그인 성공' : '로그인 실패';
  print(_loginResult);

  //===========================================================================
  //응용

  //0.타입 테스트 연산자 is
  var account = Account('111-222-33-01', 50000);
  if (account is Account) {
    //동적변수 account가 Account형식이 맞다면
    String name = account.accountNumber;
    int amount = (account as Account).balance; //형변환 예시 but 여기서는 불필요
    print('account name is $name, amount is $amount');
  }

  //1.if null 연산자
  Null loginAccount = null;
  String playerName = loginAccount ?? 'Guest';
  print('Login Player is $playerName');

  //2.캐스케이드 연산자
  Account account2 = Account('222-333-33-01', 60000)
    ..deposit(5000)
    ..transfer(account, 10000)
    ..withdraw(5000);
  print('account 2 balance is ${account2.balance}');
}
