// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/screens/how_to_win_points.dart';
import 'package:blunder_store_app/widgets/blunder_cart_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:blunder_store_app/widgets/alert_dialog_yesno.dart';

void main() => runApp(CartScreen());

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    color: fondoDark,
                                    size: 40.0,
                                  ),
                                  Text(
                                    " Productos en el Carrito:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: primaryGreen,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
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
                          child: ListView.builder(
                            //el list view debería ser alimentado por la API
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              if (index == 0) {}
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BlunderCartCard(
                                      imagen: 'zapato',
                                      nombre: 'Zapato Blunder',
                                      precio: 1500,
                                      cantidad: 1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
