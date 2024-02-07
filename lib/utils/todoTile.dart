import 'package:flutter/material.dart';

// ignore: must_be_immutable
class toDoTiles extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;

  toDoTiles(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Container(
            child: Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  "$taskName",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.yellow[400])));
  }
}
