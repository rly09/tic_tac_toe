import 'package:flutter/material.dart';
import 'package:tic_tact_oe/pages/intro_screen.dart';
import 'package:tic_tact_oe/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const IntroScreen(), // start with intro screen
    );
  }
}
