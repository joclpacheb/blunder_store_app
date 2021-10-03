// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/widgets/search_bar.dart';
//import 'package:blunder_store_app/widgets/category_card.dart';
//import 'package:blunder_store_app/widgets/bottom_nav_bar.dart';
//import 'package:blunder_store_app/screens/details_screen.dart';

class MainShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blunder Store',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and width of our device
    return Scaffold(
      backgroundColor: Color(0xff313131),
      //bottomNavigationBar: BottomNavBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Container(
                  // Here the height of the container is 45% of our total height
                  height: size.height * .15,
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
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150.0,
                      child: ListView.builder(
                        itemCount: 4,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          height: 200.0,
                          width: 200.0,
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber,
                          ),
                          child: Center(
                            child: Text(
                              "Card $index",
                              style: TextStyle(
                                color: fondoDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30.0,
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
      ),
    );
  }
}
