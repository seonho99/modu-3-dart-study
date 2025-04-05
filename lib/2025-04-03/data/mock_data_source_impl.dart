import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../data_source/todo_data_source.dart';
import '../model/todo.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo(int id) async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos/1') {
        return http.Response(
          jsonEncode({'id': 1, 'title': 'Todo 1', 'completed': false}),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Todo.fromJson(json);
    } else {
      throw Exception('todo 업로드가 실패했습니다.');
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos') {
        return http.Response(
          jsonEncode([
            {'id': 1, 'title': 'Test Todo1', 'completed': false},
            {'id': 2, 'title': 'Test Todo2', 'completed': true},
          ]),
          200,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      return list.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception('파일 업로드가 실패 했습니다.');
    }
  }
}
