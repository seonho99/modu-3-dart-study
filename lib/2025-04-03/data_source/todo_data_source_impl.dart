import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source.dart';


class TodoDataSourceImpl implements TodoDataSource {
  final http.Client client;

  TodoDataSourceImpl(this.client);

  @override
  Future<List<Todo>> readTodos() async {
    String jsonString= await File(path).readAsString();
    final List jsonList = jsonDecode(jsonString);
    List<Map<String,dynamic>> json = List<Map<String,dynamic>>.from(jsonList);
    return json;
  }

  @override
  Future<void> writeTodos(List<Map<String, dynamic>> todos) {

  }
}