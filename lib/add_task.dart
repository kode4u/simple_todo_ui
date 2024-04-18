import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/model/todo_item_model.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  var selectedValue = 'low';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_rounded),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Task",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            margin: EdgeInsets.all(16),
          ),
          Container(
            child: TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                  label: Text("Date"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            margin: EdgeInsets.all(16),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: DropdownButtonFormField(
                borderRadius: BorderRadius.circular(8),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
                value: selectedValue,
                icon: Icon(Icons.arrow_drop_down_circle, color: Colors.orange),
                items: [
                  DropdownMenuItem(
                    child: Text("Low"),
                    value: 'low',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Medium",
                    ),
                    value: 'medium',
                  ),
                  DropdownMenuItem(
                      child: Text(
                        "High",
                      ),
                      value: 'high'),
                ],
                onChanged: (value) {
                  print(value);
                }),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: () {
                TodoController todoController = Get.find<TodoController>();
                todoController.addTask(ToDoItemModel(
                    title: _textController.text,
                    date: _dateController.text,
                    priority: selectedValue,
                    isDone: false));
                print(todoController.todos.length);
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
