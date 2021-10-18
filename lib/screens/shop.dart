// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:blunder_store_app/widgets/blunder_points_card.dart';
import 'package:blunder_store_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/widgets/search_bar.dart';

class CardItem {
  String productImg;
  String productName;

  CardItem({required this.productImg, required this.productName});
}

class ShopScreen extends StatefulWidget {
  ShopScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<CardItem> cards = [
    CardItem(
        productImg: "assets/images/world_explode.png",
        productName: "Best Sellers"),
    CardItem(
        productImg: "assets/images/cyborg_girl.png",
        productName: "Ofertas Flash"),
    CardItem(
        productImg: "assets/images/cyborg_bird.png", productName: "Verano"),
    CardItem(
        productImg: "https://picsum.photos/250?image=12", productName: "d"),
    CardItem(
        productImg: "https://picsum.photos/250?image=13", productName: "e"),
    CardItem(
        productImg: "https://picsum.photos/250?image=14", productName: "f"),
    CardItem(
        productImg: "https://picsum.photos/250?image=15", productName: "g"),
    CardItem(
        productImg: "https://picsum.photos/250?image=16", productName: "h"),
    // CardItem(
    //     productImg: "https://picsum.photos/250?image=16", productName: "i"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            title: BarraBusqueda(),
            elevation: 0,
            backgroundColor: fondoDark,
          ),
        ),
        backgroundColor: fondoDark,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Text('Destacados',
                            style: TextStyle(
                                color: fondoDark,
                                fontSize: 25,
                                fontWeight: FontWeight.w700)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 25, right: 25),
                        child: RaisedButton(
                            color: rojoBlunder,
                            child: Text('Ver Todos',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/categorise');
                            }),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      height: 200.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cards.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            child: Column(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: double.infinity,
                                      width: 220,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(
                                          cards[index].productImg,
                                        ),
                                        fit: BoxFit.contain,
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  //aqui deberia colocarse el resto de las filas horizontales

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Text('Ropa',
                            style: TextStyle(
                                color: fondoDark,
                                fontSize: 25,
                                fontWeight: FontWeight.w700)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 25, right: 25),
                        child: RaisedButton(
                            color: rojoBlunder,
                            child: Text('Ver Todos',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/categorise');
                            }),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      height: 200.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cards.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          color: moradoBlunder,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            child: Column(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: double.infinity,
                                      width: 220,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(
                                          cards[index].productImg,
                                        ),
                                        fit: BoxFit.contain,
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  //aqui deberia colocarse el resto de las filas horizontales
                ],
              ),
            ),
          ),
        ));
  }
}

class BarraBusqueda extends StatelessWidget {
  const BarraBusqueda({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: MediaQuery.of(context).size.height * .15,
              decoration: BoxDecoration(
                color: Color(0xff313131),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
    );
  }
}
