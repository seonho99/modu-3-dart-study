class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['json'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
