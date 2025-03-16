import 'package:flutter/material.dart';
import 'package:overmind/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: false,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontWeight: FontWeight.bold),
          // Add other text styles as needed
        ),
      ),
    );
  }
}
