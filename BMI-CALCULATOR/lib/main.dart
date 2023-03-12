import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0xff0E1115)),
        scaffoldBackgroundColor: const Color(0xff0E1115),
      ),
      home: const InputPage(),
    );
  }
}
