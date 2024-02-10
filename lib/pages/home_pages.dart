import 'package:flutter/material.dart';
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
  List tasks = [
    ["task1 completed", true],
    ["task2 completed", false]
  ];

  VoidCallback() {
    setState(() {
      tasks.add([textcon, false]);
    });
    Navigator.of(context).pop();
  }

  void onChangeDone(bool? done, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return addDialog(
            onAdd: () {
              setState(() {
                tasks.add([textcon.text, false]);
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
      tasks.removeAt(index);
    });
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
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return toDoTiles(
                taskName: tasks[index][0],
                isCompleted: tasks[index][1],
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
