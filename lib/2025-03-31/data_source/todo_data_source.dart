import 'todo.dart';
import 'user.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
  Future<List<Todo>> getTodos();
  Future<List<User>> getUser();
}