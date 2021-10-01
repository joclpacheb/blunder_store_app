import 'package:flutter/material.dart';
import 'package:blunder_store_app/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio Tienda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
