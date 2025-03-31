import 'dart:convert';
import '../model/todo.dart';
import 'todo_data_source.dart';
import '../model/user.dart';

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
    final List<dynamic> jsonStrings = jsonDecode(jsonList);

    final todos = jsonStrings.map((json) {
      return Todo.fromJson(json as Map<String, dynamic>);
    }).toList();

    return todos;
  }

  @override
  Future<List<User>> getUser() async {
    final List<Map<String, dynamic>> jsonUsers = jsonDecode(jsonUser);
    return jsonUsers
        .map((Map<String, dynamic> json) => User.fromJson(json))
        .toList();
  }
}
