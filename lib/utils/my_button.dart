import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const MyButton({
  super.key,
  required this.buttonText,
  required this.onPressed,
  });
 
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
      ),
      child: Text(buttonText),
    );
  }
}
