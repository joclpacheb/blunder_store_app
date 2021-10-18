// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:js';

import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/screens/how_to_win_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:blunder_store_app/widgets/blunder_item_card.dart';
import 'package:blunder_store_app/api.dart';

void main() {
  runApp(Canjeo());
}

class Canjeo extends StatelessWidget {
  final Future<List<Product>> products = getProducts();

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
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          title: Text('Canjea tus puntos'),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                child: Image.asset(
                  'assets/images/store_top.png',
                  fit: BoxFit.cover,
                  height: 70,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Puntos Disponibles:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    padding: EdgeInsets.all(5.0),
                                    icon: Image.asset(
                                        'assets/images/diamond.png'),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    "1025",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 70,
                          thickness: 20,
                          indent: 100,
                          endIndent: 70,
                        ),
                        Row(
                          children: [
                            Ink(
                              child: IconButton(
                                icon: Icon(Icons.info),
                                color: blancoBlunder,
                                iconSize: 20,
                                splashRadius: 40,
                                disabledColor: blancoBlunder,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return WinPoints();
                                    }),
                                  );
                                },
                                tooltip: "¿Cómo obtener puntos?",
                              ),
                              decoration: ShapeDecoration(
                                  color: primaryGreen,
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryGreen, width: 5.0),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(children: [
                DraggableScrollableSheet(
                    initialChildSize: 1,
                    minChildSize: 0.2,
                    maxChildSize: 1,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Container(
                          child: FutureBuilder<List<Product>>(
                            future: products,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  //el list view debería ser alimentado por la API
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {}
                                    return Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: BlunderItemCard(
                                            imagen: snapshot.data![index]
                                                        .pictures.length !=
                                                    0
                                                ? snapshot
                                                    .data![index].pictures[0]
                                                : 'zapato',
                                            nombre: snapshot.data![index].name,
                                            precio: snapshot.data![index].price.toDouble(),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text(snapshot.error.toString()));
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          decoration: BoxDecoration(
                            color: rojoBlunder,
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
          ],
        ),
      ),
    );
  }
}
