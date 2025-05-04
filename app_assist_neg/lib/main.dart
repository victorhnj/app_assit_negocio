import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(AssistenteNegociosApp());
}

class AssistenteNegociosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistente de Negócios',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/input': (context) => InputScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}
