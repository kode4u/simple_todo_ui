import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/history_screen.dart';
import 'package:todo/setting_screen.dart';

import 'add_task.dart';
import 'model/todo_item_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(TodoController());
  }

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.calendar_today, color: Colors.grey),
        title: Row(children: [
          Text(
            "Task ",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Manager ",
            style: TextStyle(color: Colors.red),
          ),
        ]),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryTask()),
              );
            },
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(children: [
          Container(
            width: double.infinity,
            child: Center(
              child: Text(
                "You have [${todoController.todos.length}] pending task out of [${todoController.history.length}]",
                style: TextStyle(color: Colors.blueGrey.shade400),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
          ),
          ...todoController.todos.asMap().entries.map((e) {
            final int index = e.key;
            final ToDoItemModel task = e.value;
            return ListTile(
              title: Text(task.title!),
              subtitle: Text('${task.date!} . ${task.priority!}'),
              trailing: IconButton(
                onPressed: () {
                  ToDoItemModel item = todoController.todos[index];
                  todoController.history.add(item);
                  todoController.todos.removeAt(index);
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            );
          }).toList(),
          Spacer(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTask();
          }));
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }
}
