class Cleric {
  final int maxHp = 50;
  final int maxMp = 10;
  String name;
  int hp;
  int mp;

  Cleric(this.name, this.hp, this.mp);
}

void main() {
  Cleric cleric = Cleric('클레릭', 50, 10);
  print(cleric.name);
  print(cleric.hp);
  print(cleric.maxHp);
  print(cleric.mp);
  print(cleric.maxMp);
}
