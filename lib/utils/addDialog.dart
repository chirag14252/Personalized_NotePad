import 'package:flutter/material.dart';
import 'package:my_note/pages/home_pages.dart';
import 'package:my_note/utils/my_button.dart';

class addDialog extends StatelessWidget {
  VoidCallback onAdd;
  VoidCallback onCancel;
  final textController;
  addDialog(
      {super.key,
      required this.textController,
      required this.onAdd,
      required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[400],
        content: Container(
            height: 200,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Type your task"),
                  ),

                  //button for saving and cancel
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: "Save", onPressed: onAdd),
                      const SizedBox(width: 8),
                      MyButton(text: "Cancel", onPressed: onCancel)
                    ],
                  )
                ],
              ),
            )));
  }
}
