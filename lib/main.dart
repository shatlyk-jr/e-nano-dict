import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Techno-dict',
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 36, 255, 7)),
          fontFamily: 'Berlin',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Color.fromARGB(255, 36, 255, 7), fontSize: 20),
            bodyMedium: TextStyle(color: Color.fromARGB(255, 36, 255, 7), fontSize: 18),
          ),
          primaryColor: const Color.fromARGB(255, 7, 16, 35),
          primarySwatch: Colors.blueGrey),
      home: const HomeScreen(),
    );
  }
}
