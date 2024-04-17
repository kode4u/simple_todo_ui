import 'package:flutter/material.dart';
import 'package:todo/model/todo_item_model.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
          "Settings",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.check_rounded,
                size: 72,
                color: Colors.green,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
              ),
            ),
            Text(
              "Task Manager",
              style: TextStyle(color: Colors.grey, fontSize: 32),
            ),
            Text(
              "Version: 3.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              width: width * 0.8,
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "CLEAR ALL DATA",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              width: width * 0.8,
              margin: EdgeInsets.all(16),
              child: Text(
                "Term and Condition",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            Container(
              width: width * 0.8,
              margin: EdgeInsets.all(16),
              child: Text(
                "Privacy Policy",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Spacer(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "NUBB Technologies",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white30,
    );
  }
}
