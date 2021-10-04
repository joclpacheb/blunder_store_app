// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _paginaActual = index;
        });
      },
      currentIndex: _paginaActual,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      iconSize: 30.0,
      backgroundColor: fondoDark,
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Inicio",
          backgroundColor: fondoDark,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: "Tienda",
          backgroundColor: fondoDark,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videogame_asset),
          label: "Canjear Puntos",
          backgroundColor: fondoDark,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Carrito",
          backgroundColor: fondoDark,
        ),
      ],
    );
  }
}
