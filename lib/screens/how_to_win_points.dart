// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:blunder_store_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:blunder_store_app/widgets/blunder_points_card.dart';

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
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        BlunderPointsCard(
                          titulo: "Gira la Ruleta del Merodeador:",
                          texto:
                              "¡Prueba tu suerte! Lanzar la Ruleta del Merodeador te asegura ganarte un espectacular premio, y entre ellos, podrás ganar muchísimos puntos de lealtad.",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlunderPointsCard(
                          titulo: "Compra en nuestra tienda:",
                          texto:
                              "Demuestranos tu lealtad al comprar productos, cualquier compra de 2 o más productos te otorgará puntos de lealtad. Gana 30 puntos por comprar 2 productos, y 5 puntos adicionales por cada producto extra que compres.",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlunderPointsCard(
                          titulo: "Calificar productos:",
                          texto:
                              " ¿Te gustó tu producto? ¡A nosotros nos gusta saber tu opinión! Califica tus compras de 1 a 5 estrellas y gana puntos de lealtad por hacerlo. Gana 10 puntos por cada calificación.",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlunderPointsCard(
                          titulo: "Reseñar productos:",
                          texto:
                              "Reseñar productos: En Blunderstore nos encanta saber tus historias, así que asegúrate de contarnos en una reseña de mínimo 200 caracteres qué es lo que más te gusta de los productos que compraste, ¡y obtén puntos por hacerlo! Gana 50 puntos de lealtad por reseñar un producto.",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),

                    // ListView.builder(
                    //   itemCount: 10,
                    //   itemBuilder: (context, index) {
                    //     if (index == 0) {}
                    //     return Column(
                    //       children: <Widget>[
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: BlunderPointsCard(
                    //             texto: "hola",
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
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
