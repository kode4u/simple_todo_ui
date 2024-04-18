import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/model/todo_item_model.dart';

class HistoryTask extends StatefulWidget {
  @override
  State<HistoryTask> createState() => _HistoryTaskState();
}

class _HistoryTaskState extends State<HistoryTask> {
  @override
  Widget build(BuildContext context) {
    TodoController _todoController = Get.find<TodoController>();
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
          "History",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "You have completed [${_todoController.history.value.length}] tasks",
                  style: TextStyle(color: Colors.blueGrey.shade400),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
            ),
            ..._todoController.history.value
                .map((e) => ListTile(
                      title: Text(e.title!),
                      subtitle: Text('${e.date} . ${e.priority}'),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ))
                .toList(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
