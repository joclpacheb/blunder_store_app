import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';

class BlunderPointsCard extends StatelessWidget {
  String texto = "";
  String titulo = "";

  BlunderPointsCard({
    Key? key,
    required this.texto,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        width: 370.0,
        decoration: BoxDecoration(
          color: rojoBlunder,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            RichText(
              softWrap: true,
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    text: texto,
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
