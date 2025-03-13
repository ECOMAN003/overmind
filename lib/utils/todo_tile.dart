import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onCheckboxChanged;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: isCompleted,
              onChanged: onCheckboxChanged,
              activeColor: Colors.black,
            ),
            const SizedBox(width: 10),

            //task name
            Text(
              taskName,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decoration:
                    isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
