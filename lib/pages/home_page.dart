import 'package:flutter/material.dart';
import 'package:overmind/utils/dialog_box.dart';
import 'package:overmind/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //delete task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
  
  //save new task
  void saveNewTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        todoList.add([controller.text, false]);
      });
      controller.clear();
      Navigator.pop(context);
    }
  }

  //cancel new task
  void cancelNewTask() {
    controller.clear();
    Navigator.pop(context);
  }

  //controller
  final controller = TextEditingController();

  //list of items to be displayed in the list
  List<List> todoList = [
    ["Complete App", true],
    ["Write Poem", false],
  ];

  //function to toggle the checkbox
  void toggleCheckbox(bool? value, int index) {
    setState(() {
      todoList[index][1] = value!;
    });
  }

  //create new task
  void createNewTask(String taskName) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          //text editing controller
          controller: controller,
          onSave: saveNewTask,
          onCancel: cancelNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(title: Text('Todo App'), elevation: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask("New Task"),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            isCompleted: todoList[index][1],
            onCheckboxChanged: (value) => toggleCheckbox(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
