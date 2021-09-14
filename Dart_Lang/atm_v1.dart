void main() {
  //0.계좌생성
  Account ac1 = new Account('ac1', '12345', 20000);
  Account ac2 = new Account('ac2', '67890', 5000);

  //1.잔고확인
  print('account1 has ${ac1.balance} won');
  print('account2 has ${ac2.balance} won');

  //2.금액인출
  ac1.withdraw(7000);

  //3.계좌이체
  ac1.transfer(ac2, 5000);
}

class Account {
  String name;
  String accountNumber;
  int balance;

  Account(this.name, this.accountNumber, this.balance);

  bool withdraw(int amount) {
    if (balance >= amount) {
      balance -= amount;
      print('${this.name} has ${this.balance} won ($amount is withrawn)');
      return true;
    }
    print('fail');
    return false;
  }

  bool deposit(int amount) {
    balance += amount;
    return true;
  }

  bool transfer(Account dest, int amount) {
    if (balance >= amount) {
      balance -= amount;
      dest.deposit(amount);
      print('${dest.name} has ${dest.balance} won ($amount won is deposited)');
      print('${this.name} has ${this.balance} won');
      return true;
    }
    return false;
  }
}
