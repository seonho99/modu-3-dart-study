import 'dart:convert';
import 'todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String jsonString;
  final String jsonList;

  TodoDataSourceImpl({required this.jsonString, required this.jsonList});

  @override
  Future<Todo> getTodo() async {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Todo.fromJson(json);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final List<Map<String, dynamic>> jsonStrings = jsonDecode(jsonList);
    return jsonStrings
        .map((Map<String, dynamic> json) => Todo.fromJson(json))
        .toList();
  }
}
