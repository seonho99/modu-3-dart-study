import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source.dart';
import 'package:http/http.dart' as http;

// http 통신

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client = http.Client();

  // MovieDataSourceImpl(this.client);

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      ),
    );

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    List<dynamic> jsonList = jsonMap['results'];
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
  }
}
