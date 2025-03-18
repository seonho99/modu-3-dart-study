import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/wizard.dart';

class GreatWizard extends Wizard {
  int mp = 150;

  GreatWizard({required String name, required int hp, required Wand? wand})
    : super(name: name, hp: hp, wand: wand);

  int _superHeal = 50;

  @override
  void heal(Hero hero) {
    super.heal(hero);
    if (_superHeal <= mp) {
      hero.hp = hero.maxHp;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
      mp -= 40;
    } else {
      print('마나가 부족합니다.');
    }
  }
}
