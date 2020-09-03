import 'package:flutter/material.dart';
import 'package:vendedor_app/src/pages/main_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Botanax', home: Menu());
  }
}
