import 'package:flutter/material.dart';
import 'package:todo/history_screen.dart';
import 'package:todo/setting_screen.dart';

import 'add_task.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pendingTask = 1;
  var totalTask = 2;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Column(children: [
        Container(
          width: double.infinity,
          child: Center(
            child: Text(
              "You have [$pendingTask] pending task out of [$totalTask]",
              style: TextStyle(color: Colors.blueGrey.shade400),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
        ),
      ]),
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
