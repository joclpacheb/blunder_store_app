// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.all(35.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
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
                ],
              )),
        ),
      ],
    );
  }
}
