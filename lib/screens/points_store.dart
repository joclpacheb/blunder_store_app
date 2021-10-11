// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blunder_store_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(Canjeo());

class Canjeo extends StatelessWidget {
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
                                onPressed: () {},
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: rojoBlunder,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IntrinsicWidth(
                              child: Container(
                                height: 140.0,
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 100,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(1),
                                          child: Expanded(
                                            child: Image.asset(
                                                "assets/images/zapato.png"),
                                            flex: 2,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: ListTile(
                                                  title: Text(
                                                    "Zapato Blunder",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 6,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    OutlinedButton.icon(
                                                      style: OutlinedButton.styleFrom(
                                                          primary: fondoDark,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          side: BorderSide(
                                                              width: 2.0,
                                                              color:
                                                                  rojoBlunder),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0))),
                                                      onPressed: () {
                                                        showAlertDialog(
                                                            context);
                                                      },
                                                      icon: Image.asset(
                                                        'assets/images/diamond.png',
                                                        height: 25,
                                                      ),
                                                      label: Text(
                                                        "15000",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        flex: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget continueButton = TextButton(
      child: Text("Si".toUpperCase(),
          style: TextStyle(fontSize: 14, color: Colors.white)),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
          backgroundColor: MaterialStateProperty.all<Color>(primaryGreen),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: primaryGreen)))),
      onPressed: () =>
          Navigator.of(context, rootNavigator: true).pop('dialog'));

  AlertDialog alert = AlertDialog(
    content: Padding(
      padding: const EdgeInsets.all(28.0),
      child: Text(
        "¿Deseas canjear tus puntos por este articulo?",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: fondoDark,
        ),
      ),
    ),
    actions: [
      TextButton(
          child: Text("no".toUpperCase(),
              style: TextStyle(fontSize: 14, color: Colors.white)),
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
              foregroundColor: MaterialStateProperty.all<Color>(rojoBlunder),
              backgroundColor: MaterialStateProperty.all<Color>(rojoBlunder),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: rojoBlunder)))),
          onPressed: () => {
                Navigator.of(context, rootNavigator: true).pop('dialog')
                //aquí se hace el post del rest api
              }),
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
