import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';

extension UserExtension on UserDto {
  User toUser() {
    return User(
      id: id ?? 'id Error',
      email: email ?? 'email Error',
      password: password ?? 'password Error',
      createdAt: DateTime.parse(createdAt) ?? DateTime.now(),
    );
  }
}
