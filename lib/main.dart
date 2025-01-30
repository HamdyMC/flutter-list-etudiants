import 'package:flutter/material.dart';
import '../ui/EtudiantList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List App',
      home: EtudiantListScreen(),
    );
  }
}
