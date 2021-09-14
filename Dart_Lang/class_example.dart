void main() {
  Game game1 = Game('starcraft', 'strategy');
  Game game2 = ArcadeGame('strick 1945', 'Shotting', true);

  print('game1 is ${game1.name}');
  print('game1 is ${game2.name}');

  game1.genre = 'Realtime Strategy';

  game1.play();
  game2.play();
}

class Game {
  String _name;
  String _genre;

  Game(this._name, this._genre);

  //getter, setter
  String get name => _name;
  set genre(String g) => this._genre = g;

  void play() {
    print('play $_name game($_genre)!!');
  }
}

class ArcadeGame extends Game {
  bool _joystickSupport = false;

  ArcadeGame(String name, String genre, this._joystickSupport)
      : super(name, genre);

  @override
  void play() {
    print('$name support joystick? $_joystickSupport');
  }
}
