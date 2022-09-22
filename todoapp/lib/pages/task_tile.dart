import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  final String taskText;
  final bool taskDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  TaskTile(
      {super.key,
      required this.taskText,
      required this.taskDone,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteTask,
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Checkbox(value: taskDone, onChanged: onChanged),
                Text(
                  taskText,
                  style: taskDone == false
                      ? const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.none)
                      : const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough),
                ),
              ],
            )),
      ),
    );
  }
}
