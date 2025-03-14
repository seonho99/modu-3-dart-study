void main() {
  final hero1 = Hero('홍길동',100);
  final hero2 = hero1;

  hero2.hp = 200;

  print(hero2.hp);
  print(hero1.hp);

}

class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

}

