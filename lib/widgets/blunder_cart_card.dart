// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/widgets/alert_dialog_yesno.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.iconSize,
    required this.value,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

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
          height: 160.0,
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
                Flexible(
                  child: Image.asset("assets/images/$imagen.png"),
                  flex: 5,
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 5,
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                nombre,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
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
                                    padding: EdgeInsets.all(15),
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
                                icon: Icon(Icons.attach_money,
                                    color: Colors.white),
                                label: Text(
                                  precio.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomStepper(
                          iconSize: 25,
                          lowerLimit: 1,
                          stepValue: 1,
                          upperLimit: 999,
                          value: 1,
                        ),
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

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RoundedIconButton(
          icon: Icons.remove,
          iconSize: widget.iconSize,
          onPress: () {
            setState(() {
              widget.value = widget.value == widget.lowerLimit
                  ? widget.lowerLimit
                  : widget.value -= widget.stepValue;
            });
          },
        ),
        Container(
          width: widget.iconSize,
          child: Text(
            '${widget.value}',
            style: TextStyle(
              fontSize: widget.iconSize * 0.8,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        RoundedIconButton(
          icon: Icons.add,
          iconSize: widget.iconSize,
          onPress: () {
            setState(() {
              widget.value = widget.value == widget.upperLimit
                  ? widget.upperLimit
                  : widget.value += widget.stepValue;
            });
          },
        ),
        Icon(
          Icons.delete,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {required this.icon, required this.onPress, required this.iconSize});

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: null,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconSize * 0.2)),
      fillColor: Colors.grey[300],
      child: Icon(
        icon,
        color: fondoDark,
        size: iconSize * 0.8,
      ),
    );
  }
}
