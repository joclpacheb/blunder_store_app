// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Destacados",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0,
                          color: fondoDark,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
