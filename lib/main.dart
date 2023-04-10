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
          iconTheme: const IconThemeData(color: Colors.amber),
          fontFamily: 'Berlin',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.amber, fontSize: 20),
            bodyMedium: TextStyle(color: Colors.amber, fontSize: 18),
          ),
          primaryColor: const Color.fromARGB(255, 7, 16, 35),
          primarySwatch: Colors.blueGrey),
      home: HomeScreen(),
    );
  }
}
