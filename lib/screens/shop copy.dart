// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blunder_store_app/widgets/blunder_points_card.dart';
import 'package:blunder_store_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/widgets/search_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: <Widget>[
              Container(
                // Here the height of the container is 45% of our total height
                height: MediaQuery.of(context).size.height * .15,
                decoration: BoxDecoration(
                  color: Color(0xff313131),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SearchBar(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            padding: const EdgeInsets.all(2.0),
            child: Stack(children: [
              DraggableScrollableSheet(
                  initialChildSize: 1,
                  minChildSize: 0.2,
                  maxChildSize: 1,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(1, 1, 1, 20),
                      child: Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, bottom: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 70.0),
                                    child: Text(
                                      "Destacados",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30.0,
                                        color: fondoDark,
                                      ),
                                    ),
                                  ),
                                  Text('Ver todos',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        color: fondoDark,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                            ),
                            // BlunderCategoryCard(
                            //   svgSrc: "assets/icons/apple.png",
                            //   title: 'Frutas',
                            //   press: () {},
                            // ),
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
        ),
      ],
    );
  }
}
