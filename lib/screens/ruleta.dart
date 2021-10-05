// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(Ruleta());

//TO DO: implementar ruleta y app bar con willpopback arrow button https://medium.com/@iamatul_k/flutter-handle-back-button-in-a-flutter-application-override-back-arrow-button-in-app-bar-d17e0a3d41f
class Ruleta extends StatelessWidget {
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
            child: Text('Aquí va la ruleta'),
          ),
        ),
      ),
    );
  }
}
