// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';

class AlertYesNo extends StatelessWidget {
  String pregunta = "";

  AlertYesNo({
    Key? key,
    required this.pregunta,
  }) : super(key: key);

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
          pregunta,
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

  @override
  Widget build(BuildContext context) {
    throw showAlertDialog(context);
  }
}
