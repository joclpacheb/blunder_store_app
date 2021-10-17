// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'dart:math';

import 'package:blunder_store_app/constants.dart';
import 'package:flutter/material.dart';
import 'board_view.dart';
import 'model.dart';

class RuletaW extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RuletaState();
  }
}

class _RuletaState extends State<RuletaW> with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _current = 0;
  late AnimationController _ctrl;
  late Animation _ani;
  List<Luck> _items = [
    Luck("apple", Colors.accents[0]),
    Luck("raspberry", Colors.accents[2]),
    Luck("grapes", Colors.accents[4]),
    Luck("fruit", Colors.accents[6]),
    Luck("milk", Colors.accents[8]),
    Luck("salad", Colors.accents[10]),
    Luck("cheese", Colors.accents[12]),
    Luck("carrot", Colors.accents[14]),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: fondoDark,
        ),
        child: AnimatedBuilder(
            animation: _ani,
            builder: (context, child) {
              final _value = _ani.value;
              final _angle = _value * this._angle;
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  BoardView(items: _items, current: _current, angle: _angle),
                  _buildText(
                      "¡Prueba tu suerte! Gira la ruleta y gana premios y descuentos en la tienda."),
                  _buildGo(),
                  // _buildResult(_value),
                  _buildTitle(),
                  _buildBottomW(_value),
                ],
              );
            }),
      ),
    );
  }

  _buildText(String texto) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ));
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: Text(
            "Presiona para Girar",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Text(
              "Ruleta del Merodeador",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  _buildBottomW(_value) {
    var _index = _calIndex(_value * _angle + _current);
    String _asset = _items[_index].asset;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 30),
                  child: Row(
                    children: [
                      Text(
                        "Resultado:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(_asset, height: 80, width: 80),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14.0, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Costo:   ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              primary: fondoDark,
                              padding: EdgeInsets.all(20),
                              side: BorderSide(width: 2.0, color: rojoBlunder),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: null,
                          icon: Image.asset(
                            'assets/images/diamond.png',
                            height: 25,
                          ),
                          label: Text(
                            '200',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }
}
