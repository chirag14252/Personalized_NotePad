import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_note/database/database.dart';
import 'package:my_note/utils/addDialog.dart';
import 'package:my_note/utils/drawer_dialog.dart';
import 'package:my_note/utils/todoTile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textcon = TextEditingController();
  final _mybox = Hive.box('hive_box');
  database db = new database();

  @override
  void initState() {
    if (_mybox.get("todoList") != null) {
      db.LoadData();
    }
  }

  VoidCallback() {
    setState(() {
      db.tasks.add([textcon, false]);
      textcon.clear();
    });
    db.LoadData();
    Navigator.of(context).pop();
  }

  void onChangeDone(bool? done, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updateData();
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return addDialog(
            onAdd: () {
              setState(() {
                db.tasks.add([textcon.text, false]);
              });
              Navigator.of(context).pop();
            },
            onCancel: () {
              Navigator.of(context).pop();
            },
            textController: textcon,
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      drawer: DrawerCustom(),
      appBar: AppBar(
          title: Text(
            "MY NOTES",
            style: TextStyle(fontSize: 20),
          ),
          elevation: 0,
          backgroundColor: Colors.yellow[400]),
      body: ListView.builder(
          itemCount: db.tasks.length,
          itemBuilder: (context, index) {
            return toDoTiles(
                taskName: db.tasks[index][0],
                isCompleted: db.tasks[index][1],
                onChanged: (value) => onChangeDone(value, index),
                deleteFunction: (context) => deleteTask(index));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask, // an add task screen will appear
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.yellow[400],
      ),
    );
  }
}
