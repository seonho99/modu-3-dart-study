import 'dart:convert';
import 'todo.dart';
import 'todo_data_source.dart';
import 'user.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String jsonString;
  final String jsonList;
  final String jsonUser;

  TodoDataSourceImpl({
    required this.jsonString,
    required this.jsonList,
    required this.jsonUser,
  });

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

  @override
  Future<List<User>> getUser() async {
    final List<Map<String, dynamic>> jsonUsers = jsonDecode(jsonUser);
    return jsonUsers
        .map((Map<String, dynamic> json) => User.fromJson(json))
        .toList();
  }
}
