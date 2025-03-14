import 'dart:math';

class Cleric {
  static int maxHp = 50;
  static int maxMp = 10;
  String name;
  int hp = 50;
  int mp = 10;

  Cleric(this.name, this.hp, this.mp);

  var random = Random();

  void selfAid() {
    if (mp > 5) {
      mp -= 5;
      print('셀프 에이드를 사용했습니다.\nMP 5 사용: \n남은 MP $mp \nMax HP 까지 회복');
      hp = maxHp;
    } else {
      print('셀프 에이드를 사용할 수 없습니다.\n남은 MP $mp');
    }
  }

  int prey(int letsGoPrey) {
    if (letsGoPrey == 0) {
      return mp;
    } else if (letsGoPrey == 1 && mp <= 9) {
      if (mp + random.nextInt(3) > 10) {
        return maxMp;
      } else {
        return mp + random.nextInt(3);
      }
    } else if (letsGoPrey == 2 && mp < 7) {
      if (mp + random.nextInt(5) > 10) {
        return maxMp;
      } else {
        return mp + random.nextInt(5);
      }
    } else if (letsGoPrey == 3 && mp < 6) {
      return mp + random.nextInt(3) + 3;
    } else {
      return maxMp;
    }
  }
}

void main() {

  Cleric cleric = Cleric('클레릭', 50, 5);
}
