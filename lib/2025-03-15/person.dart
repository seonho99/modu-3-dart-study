void main() {
  Person person = Person('선호',1999);
  print(person.age);
}

class Person {
  final String name;
  final int birthYear;
  int age;

  Person(this.name, this.birthYear) : age = DateTime.now().year - birthYear;
}
