import 'package:flutter/material.dart';

class addDialog extends StatefulWidget {
  const addDialog({super.key});

  @override
  State<addDialog> createState() => _addDialogState();
}

class _addDialogState extends State<addDialog> {
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 200,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Text(
                "ADD TASK",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "type your task"),
                ),
              ),
              ElevatedButton(onPressed: () => {}, child: Text("ADD"))
            ],
          ),
        ),
      ),
    );
  }
}
