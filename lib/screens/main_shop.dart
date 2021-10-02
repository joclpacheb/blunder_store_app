// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

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
                    print('Click Message');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .30,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Destacados",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        // children: <Widget>[
                        //   CategoryCard(
                        //     title: "Comidas",
                        //     svgSrc: "assets/icons/Hamburger.svg",
                        //     press: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) {
                        //           return DetailsScreen();
                        //         }),
                        //       );
                        //     },
                        //   ),
                        //   CategoryCard(
                        //     title: "Deporte",
                        //     svgSrc: "assets/icons/Excercises.svg",
                        //     press: () {},
                        //   ),
                        //   CategoryCard(
                        //     title: "Meditación",
                        //     svgSrc: "assets/icons/Meditation.svg",
                        //     press: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) {
                        //           return DetailsScreen();
                        //         }),
                        //       );
                        //     },
                        //   ),
                        //   CategoryCard(
                        //     title: "Yoga",
                        //     svgSrc: "assets/icons/yoga.svg",
                        //     press: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) {
                        //           return DetailsScreen();
                        //         }),
                        //       );
                        //     },
                        //   ),
                        // ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
