import 'package:flutter/material.dart';
import 'package:overmind/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  //text edtitng controller
  final TextEditingController controller;

  //ON SAVE AND CANCEL
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter Task Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(onPressed: onSave, buttonText: 'Save'),
                MyButton(onPressed: onCancel, buttonText: 'Cancel'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
