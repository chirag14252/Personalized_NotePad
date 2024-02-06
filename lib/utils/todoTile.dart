import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Row(
            children: [
              Checkbox(value: isCompleted, onChanged: onChanged),
              Text(
                "$taskName",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow[400],
              borderRadius: BorderRadius.circular(10)),
        ));
  }
}
