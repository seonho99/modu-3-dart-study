import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../data_source/movie_data_source.dart';
import '../data_source/todo_data_source_impl.dart';

class MockHttpClientImpl implements MovieDataSource {

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos') {
        return http.Response(
          json.encode([
            {'id': 1, 'title': 'Test Todo 1', 'completed': false},
            {'id': 2, 'title': 'Test Todo 2', 'completed': true},
          ]),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
          }
        );
      }
      return http.Response('Not Found', 404);
    });



    final dataSource = TodoDataSourceImpl(client);
  }

}
