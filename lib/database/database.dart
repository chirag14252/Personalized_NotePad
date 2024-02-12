import 'package:hive/hive.dart';

class database {
  List tasks = [];
  var box = Hive.box('hive_box');
  void LoadData() {
    tasks = box.get('todoList');
  }

  void updateData() {
    box.put('todoList', tasks);
  }
}
