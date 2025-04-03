import 'dart:convert';

import '../data_source/movie_data_source.dart';

class MockHttpClientImpl implements MovieDataSource {
  final MovieDataSource client;

  MockHttpClientImpl(this.client);

  @override
  Future<List<Map<String,dynamic>>> getUpcomingMovies() async {
    final response = '''{
      "id": 939243,
      "title": "수퍼 소닉 3",
      "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
      "release_date": "2024-12-19"
    }''';

    Map<String, dynamic> jsonMap = jsonDecode(response);

    return [jsonMap];
  }
}
