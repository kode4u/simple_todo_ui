import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'add_task.dart';
import 'home_screen.dart';

void main() async{
  await GetStorage.init();
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
