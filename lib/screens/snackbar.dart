import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';

void showMessage(message, context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: primaryGreen,
      content:Text(message, style: TextStyle(color: Colors.white),),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Cerrar',
        onPressed: () {},
      ),
    ),
  );
}