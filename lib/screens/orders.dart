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
        SingleChildScrollView(
          //esto era un expanded antes, se cambió a single child scroll view por el responsive, pero ahora sale una barra negra abajo...
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/cyborg-bull.png',
                    fit: BoxFit.contain,
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: DefaultTabController(
                        length: 2, // length of tabs
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TabBar(
                                labelStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                labelColor: fondoDark,
                                unselectedLabelColor: primaryGreen,
                                indicatorColor: primaryGreen,
                                tabs: [
                                  Tab(
                                    text: 'Pendientes',
                                  ),
                                  Tab(text: 'Historial'),
                                ],
                              ),
                              Container(
                                  height: 300, //height of TabBarView
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.grey, width: 0.5))),
                                  child: TabBarView(children: <Widget>[
                                    Center(
                                      child: Text('Pendientes',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Center(
                                      child: Text('Historial',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ]))
                            ])),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
