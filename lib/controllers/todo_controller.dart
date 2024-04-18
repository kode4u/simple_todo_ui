import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/todo_item_model.dart';

class TodoController extends GetxController {
  var todos = [
    ToDoItemModel(
        title: 'Learn JS', priority: 'low', date: '2024-03-03', isDone: true)
  ].obs;
  var history = [
    ToDoItemModel(
        title: 'Learn Flutter',
        priority: 'low',
        date: '2024-03-03',
        isDone: true)
  ].obs;

  void addTask(ToDoItemModel task) {
    todos.add(task);
    saveToLocalStorage();
  }

  void saveToLocalStorage() {
    print('json encode: ${jsonEncode(todos)}');
    String s_todos = jsonEncode(todos);
    final box = GetStorage();
    box.write('todos', s_todos);

    String s_history = jsonEncode(history);
    box.write('history', s_history);
  }
}
