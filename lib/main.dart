import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/theme/style.dart';
import 'package:flutter/material.dart';
//
import 'screens/dashboard.dart';

void main() {
  findAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      home: const Dashboard(),
    );
  }
}
