import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/widgets/alert_dialog_yesno.dart';

class BlunderItemCard extends StatelessWidget {
  String nombre = "";
  String imagen =
      ""; //la imagen deberá ser especificada por su nombre sin extensión, debe ser formato png y estar en la carpeta /images
  double precio = 0;

  BlunderItemCard({
    Key? key,
    required this.nombre,
    required this.imagen,
    required this.precio,
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
                      child: imagen != 'zapato' ? Image.network(imagen) : Image.asset("assets/images/$imagen.png"),
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
                                        width: 2.0, color: rojoBlunder),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                onPressed: () {
                                  AlertYesNo(
                                    pregunta: "¿Desea comprar este producto?",
                                  ).showAlertDialog(context);
                                },
                                icon: Image.asset(
                                  'assets/images/diamond.png',
                                  height: 25,
                                ),
                                label: Text(
                                  precio.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
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
