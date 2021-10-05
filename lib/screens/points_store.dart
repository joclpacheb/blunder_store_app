// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(Canjeo());

class Canjeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Canjeo'),
          ),
        ),
      ),
    );
  }
}
