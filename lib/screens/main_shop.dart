// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:blunder_store_app/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
//import 'package:blunder_store_app/widgets/category_card.dart';
//import 'package:blunder_store_app/widgets/bottom_nav_bar.dart';
//import 'package:blunder_store_app/screens/details_screen.dart';
import 'package:blunder_store_app/screens/shop.dart';
import 'package:blunder_store_app/screens/orders.dart';
import 'package:blunder_store_app/screens/gamified_store.dart';

class MainShop extends StatefulWidget {
  @override
  State<MainShop> createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blunder Store',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme:
            Theme.of(context).textTheme.apply(displayColor: blancoBlunder),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaActual = 0;

  List<Widget> _paginas = [
    ShopScreen(),
    Orders(),
    GamifiedStore(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and width of our device
    return Scaffold(
        backgroundColor: Color(0xff313131),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: AppBar(
              backgroundColor: Color(0xff313131),
              primary:
                  false, //elimina la safe area de la appbar para ajustar el padding
              bottomOpacity: 0.0, //eliminar la sombra por defecto
              elevation: 0.0,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/blunder_w.png',
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.all(5.0),
                      icon: Image.asset('assets/images/diamond.png'),
                      onPressed: () {},
                    ),
                    Text(
                      "1025",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(
                  height: 100,
                  thickness: 20,
                  indent: 20,
                  endIndent: 20,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xffc4c4c4),
                  child: IconButton(
                    padding: EdgeInsets.all(5.0),
                    icon: Image.asset('assets/images/smile.png'),
                    onPressed: () {
                      // Implement navigation to profile page...
                      // ignore: avoid_print
                      print('Click Message');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
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
              label: "Pedidos",
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
        ));
  }
}
