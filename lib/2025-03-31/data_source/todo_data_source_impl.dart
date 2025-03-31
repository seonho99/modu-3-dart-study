import 'dart:convert';


class TodoDataSourceImpl implements TodoDataSource {
  final String jsonString;

  TodoDataSourceImpl({required this.jsonString});

  @override
  Future<Todo> getTodo() async {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Todo.fromJson(json);
  }
}
