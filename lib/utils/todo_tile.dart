import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onCheckboxChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    this.onCheckboxChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: BehindMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12.0),
          )
        ]),
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
                activeColor: Colors.deepPurple,
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
      ),
    );
  }
}
