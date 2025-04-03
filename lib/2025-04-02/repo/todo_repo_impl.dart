
import 'dart:io';
import '../data_source/todo_data_source.dart';
import '../data_source/todo_data_source_impl.dart';
import '../model/todo.dart';
import 'todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  TodoDataSource _todoDataSource;


  TodoRepoImpl(TodoDataSource _todoDataSource):_todoDataSource = todoDataSource;

  @override
  Future<List<Todo>> getTodos() {

  }

  @override
  Future<void> addTodo(String title) {

  }

  @override
  Future<void> updateTodo(int id, String newTitle) {

  }

  @override
  Future<void> toggleTodo(int id) {

  }

  @override
  Future<void> deleteTodo(int id) {

  }
}