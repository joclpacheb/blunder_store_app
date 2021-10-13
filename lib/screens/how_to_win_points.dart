// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blunder_store_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';

void main() => runApp(WinPoints());

class WinPoints extends StatelessWidget {
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
          elevation: 2,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          title: Text('¿Cómo ganar Puntos de lealtad?'),
        ),
        body: Stack(children: [
          DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.2,
              maxChildSize: 1,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Container(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (index == 0) {}
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlunderPointsCard(),
                            ),
                          ],
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                      color: fondoDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}

class BlunderPointsCard extends StatelessWidget {
  const BlunderPointsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        height: 140.0,
        width: 370.0,
        decoration: BoxDecoration(
          color: rojoBlunder,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
                text:
                    "This is where I want to place the text received by parameter",
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
