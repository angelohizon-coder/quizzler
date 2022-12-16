import 'quizzler.dart';
import 'welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //routing
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => Welcome(),
        '/quizzler': (context) => Quizzler(),
      },
    ),
  );
}
