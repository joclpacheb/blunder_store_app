// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/widgets/alert_dialog_yesno.dart';

class BlunderCartCard extends StatelessWidget {
  String nombre = "";
  String imagen =
      ""; //la imagen deberá ser especificada por su nombre sin extensión, debe ser formato png y estar en la carpeta /images
  int precio = 0;
  int cantidad = 0;
  BlunderCartCard({
    Key? key,
    required this.nombre,
    required this.imagen,
    required this.precio,
    required this.cantidad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 140.0,
          width: 370.0,
          decoration: BoxDecoration(
            color: moradoBlunder,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 100,
            color: moradoBlunder,
            child: Row(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Expanded(
                      child: Image.asset("assets/images/$imagen.png"),
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
                              nombre,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                    primary: fondoDark,
                                    padding: EdgeInsets.all(20),
                                    side: BorderSide(
                                        width: 2.0, color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                onPressed: () {
                                  AlertYesNo(
                                    pregunta: "¿Desea comprar este producto?",
                                  ).showAlertDialog(context);
                                },
                                icon: Icon(Icons.attach_money),
                                label: Text(
                                  precio.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
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
      ],
    );
  }
}
