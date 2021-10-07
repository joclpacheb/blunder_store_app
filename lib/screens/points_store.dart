// ignore_for_file: prefer_const_constructors

import 'package:blunder_store_app/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(Canjeo());

//TO DO: implementar ruleta y app bar con willpopback arrow button https://medium.com/@iamatul_k/flutter-handle-back-button-in-a-flutter-application-override-back-arrow-button-in-app-bar-d17e0a3d41f
class Canjeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: fondoDark,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          backgroundColor: fondoDark,
          elevation: 20,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          title: Text('Canjea tus puntos'),
          actions: [
            Row(
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Image.asset('assets/images/diamond.png'),
                  onPressed: () {},
                ),
                Text(
                  "1025",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: 100,
                  thickness: 20,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Container(),
        ),
      ),
    );
  }
}
