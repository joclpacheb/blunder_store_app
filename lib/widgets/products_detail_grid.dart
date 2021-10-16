import 'package:flutter/material.dart';

class CardItem {
  String productImg;
  String productName;

  CardItem({required this.productImg, required this.productName});
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.cards,
  }) : super(key: key);

  final List<CardItem> cards;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) => Card(
          child: InkWell(
            child: Column(
              children: [
                Flexible(
                  child: Container(
                    height: double.infinity,
                    width: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        cards[index].productImg,
                      ),
                      fit: BoxFit.fitHeight,
                    )),
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
