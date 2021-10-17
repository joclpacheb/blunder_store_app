// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:blunder_store_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:blunder_store_app/widgets/blunder_points_card.dart';

import 'how_to_win_points.dart';

void main() => runApp(UserProfile());

class UserProfile extends StatelessWidget {
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
          backgroundColor: primaryGreen,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Perfil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 7),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(children: [
          Container(
            height: 210,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: primaryGreen,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffc4c4c4),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: Image.asset(
                                            'assets/images/smile.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "johndoe@gmail.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "+584145134870",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
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
                                indent: 50,
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
