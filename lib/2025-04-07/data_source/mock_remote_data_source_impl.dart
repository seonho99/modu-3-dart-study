import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../dto/user_dto.dart';
import '../repository/auth_repository_impl.dart';
import 'auth_remote_data_source.dart';

// class MockRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final mockClient = MockClient((request) async {
//     if (request.url.toString() == '') {
//       return http.Response(
//         jsonEncode({"email": 'test@example.com', "password": '12345678'}),
//         200,
//       );
//     }
//   });
//
//   @override
//   Future<UserDto> registerUser({
//     required String email,
//     required String password,
//   }) async {}
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../dto/user_dto.dart';
import '../repository/auth_repository.dart';
import 'auth_remote_data_source.dart';

class MockRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;

  MockRemoteDataSourceImpl()
      : _client = MockClient((request) async {
    final body = jsonDecode(request.body);
    final email = body['email'] as String;
    final password = body['password'] as String;

    if (!email.contains('@')) {
      return http.Response('Invalid email', 400);
    }
    if (password.length < 6) {
      return http.Response('Weak password', 400);
    }
    if (email == 'network@error.com') {
      return http.Response('Network Error', 500);
    }

    // 성공
    return http.Response(jsonEncode({
      'id': 'mock123',
      'email': email,
      'password': password,
      'createdAt': DateTime.now().toIso8601String(),
    }), 200);
  });

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      Uri.parse('https://fake.api/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return UserDto.fromJson(json);
    } else if (response.statusCode == 400) {
      throw RegistrationError.invalidEmail;
    } else if (response.statusCode == 500) {
      throw RegistrationError.networkError;
    } else {
      throw Exception('Unhandled error');
    }
  }
}


