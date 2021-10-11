// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:blunder_store_app/screens/ruleta.dart';
import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:blunder_store_app/screens/points_store.dart';

class GamifiedStore extends StatelessWidget {
  const GamifiedStore({Key? key}) : super(key: key);

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
                height: MediaQuery.of(context).size.height * .005,
                decoration: BoxDecoration(
                  color: Color(0xff313131),
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
              padding: const EdgeInsets.all(30.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                          child: Text(
                            "¡Disfruta todas las opciones que Blunder Store trae para ti!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: fondoDark,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 500,
                              height: 150,
                              child: Column(children: <Widget>[
                                SpinTheWheelCard(),
                              ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 500,
                              height: 150,
                              child: Column(children: <Widget>[
                                PointWithdrawalCard(),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class SpinTheWheelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final headline6 = themeData.textTheme.headline6;
    return Expanded(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: moradoBlunder,
        child: InkWell(
          onTap: () {
            print("Ir a Ruleta");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Ruleta();
              }),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/ruleta.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Prueba tu suerte en la Ruleta del Merodeador',
                    textAlign: TextAlign.center,
                    style: headline6?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PointWithdrawalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final headline6 = themeData.textTheme.headline6;

    return Expanded(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: rojoBlunder,
        child: InkWell(
          onTap: () {
            print("Ir a Canjeo");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Canjeo();
              }),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xffc4c4c4),
                    child: Image.asset(
                      'assets/images/diamond.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Canjea tus puntos de lealtad',
                    textAlign: TextAlign.center,
                    style: headline6?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
