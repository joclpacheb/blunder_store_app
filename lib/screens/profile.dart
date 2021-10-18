// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/screens/edit_profile.dart';
import 'package:blunder_store_app/screens/points_store.dart';
import 'package:blunder_store_app/widgets/alert_dialog_yesno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'how_to_win_points.dart';
import 'package:blunder_store_app/api.dart';

class SubCardItem {
  String productImg;
  String productName;
  double productPrice;

  SubCardItem(
      {required this.productImg,
      required this.productName,
      required this.productPrice});
}

class CuponItemCard {
  String codigo = "CPN-20";

// porcentaje=codigo.substring(3);
//var newString = string.substring(string.length - 5);

  CuponItemCard({required this.codigo});
}

void main() => {
  getUser().then((value) => {
      if(value != {})
        user = value,
    }),
  runApp(UserProfile())
};

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: fondoDark,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          backgroundColor: primaryGreen,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => {
                AlertYesNo(
                  pregunta: "¿Desea cerrar la sesión?",
                ).showAlertDialog(context)
              },
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Perfil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 7),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return editProfile();
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(children: [
          Container(
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: primaryGreen,
                  ),
                  child: FutureBuilder<Map<String, dynamic>>(
                      future: getUser(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffc4c4c4),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                child: Image.asset(
                                                    'assets/images/smile.png'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      user['data']['nombres'] + " " + user['data']['apellidos'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      user['data']['correo'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      user['data']['telefono'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        else if (snapshot.hasError){
                          print(snapshot.error);
                          return Center(child: Text('errror'));
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Puntos Disponibles:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        IconButton(
                                          padding: EdgeInsets.all(5.0),
                                          icon: Image.asset(
                                              'assets/images/diamond.png'),
                                          onPressed: () {},
                                        ),
                                        FutureBuilder<Map<String, dynamic>>(
                                          future: getUser(),
                                          builder: (context, snapshot){
                                            if(snapshot.hasData){
                                              return Text(
                                                user['data']['puntos'].toString(),
                                                style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                              );
                                            }
                                            else if (snapshot.hasError){
                                              print(snapshot.error);
                                              return Center(child: Text('errror'));
                                            }
                                            return Center(child: CircularProgressIndicator());
                                          }
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 40,
                                thickness: 20,
                                indent: 40,
                                endIndent: 30,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: primaryGreen,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        color: blancoBlunder,
                                      ),
                                      iconSize: 22,
                                      splashRadius: 70,
                                      disabledColor: blancoBlunder,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return WinPoints();
                                          }),
                                        );
                                      },
                                      tooltip: "¿Cómo obtener puntos?",
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: primaryGreen,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.storefront,
                                        color: blancoBlunder,
                                      ),
                                      iconSize: 22,
                                      splashRadius: 70,
                                      disabledColor: blancoBlunder,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return Canjeo();
                                          }),
                                        );
                                      },
                                      tooltip: "Canjea tus Puntos",
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ExchangesCard(
                          titulo: "Canjes Realizados",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CouponsCard(
                          titulo: "Cupones Obtenidos",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: fondoDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
//======================================================================================================
// Widgets de Canjes
//======================================================================================================

class ExchangesCard extends StatelessWidget {
  String titulo = "";
  List<SubCardItem> cards = [
    SubCardItem(
        productImg: "assets/images/zapato.png",
        productPrice: 200.0,
        productName: "Zapato Blunder"),
    SubCardItem(
        productImg: "assets/images/ps4_console_white_1.png",
        productPrice: 100.0,
        productName: "Control PS4"),
    SubCardItem(
        productImg: "assets/images/wireless headset.png",
        productPrice: 70.0,
        productName: "Audifonos"),
  ];

  ExchangesCard({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        width: 370.0,
        decoration: BoxDecoration(
          color: azulBlunder,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: 20.0,
                    color: fondoDark,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: CanjesSubCard(
                  nombre: cards[index].productName,
                  precio: cards[index].productPrice,
                  imagen: cards[index].productImg,
                ),
              ),
            ),
            //los llamados a los items parametros de la lista cards se hacen asi => cards[index].productImg,
          ],
        ),
      )
    ]);
  }
}

class CanjesSubCard extends StatelessWidget {
  String nombre = "";
  String imagen =
      ""; //la imagen deberá ser especificada por su nombre sin extensión, debe ser formato png y estar en la carpeta /images
  double precio = 0;
  CanjesSubCard({
    Key? key,
    required this.nombre,
    required this.imagen,
    required this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 49,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(
              left: 5,
              right: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagen),
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.circle,
                    color: Color(0xffc4c4c4),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  nombre,
                  style: TextStyle(
                    color: Color(0xff313131),
                    fontSize: 17,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/images/diamond.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  precio.toString(),
                  style: TextStyle(
                    color: fondoDark,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//======================================================================================================
// Widgets de Cupones
//======================================================================================================
class CouponsCard extends StatelessWidget {
  String titulo = "";
  List<CuponItemCard> cupones = [
    CuponItemCard(
      codigo: "CPN-10",
    ),
    CuponItemCard(
      codigo: "CPN-80",
    ),
    CuponItemCard(
      codigo: "CPN-70",
    ),
  ];
  CouponsCard({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        width: 370.0,
        decoration: BoxDecoration(
          color: terracotaBlunder,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: 20.0,
                    color: fondoDark,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: cupones.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: CuponSubCard(
                  codigo: cupones[index].codigo,
                  porcentaje: cupones[index]
                          .codigo
                          .substring(4, cupones[index].codigo.length) +
                      '%', //se crea un substring a partir del caracter 4: (C)(P)(N)(-)..... Hasta la longitud
                ),
              ),
            )

            // CuponSubCard(
            //   //aqui deberia consumir la api y traerse los parámetros de los canjes realizados
            //   codigo: 'CPN-25',
            //   porcentaje: '25' + ' %',
            // ),
          ],
        ),
      )
    ]);
  }
}

class CuponSubCard extends StatelessWidget {
  String codigo = "";
  String porcentaje = "";
  CuponSubCard({
    Key? key,
    required this.codigo,
    required this.porcentaje,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 49,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 272,
            height: 49,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 272,
                  height: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 9,
                    top: 4,
                    bottom: 5,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.confirmation_number,
                        color: fondoDark,
                      ),
                      SizedBox(width: 20),
                      Text(
                        codigo,
                        style: TextStyle(
                          color: Color(0xff313131),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 28.67),
                      Text(
                        porcentaje,
                        style: TextStyle(
                          color: Color(0xff313131),
                          fontSize: 17,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 28.67),
                      Container(
                        width: 47,
                        height: 40,
                        child: Stack(
                          children: [
                            Container(
                              width: 47,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff009c8a),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: IconButton(
                                      tooltip: "Copiar al Portapapeles",
                                      onPressed: () {
                                        Clipboard.setData(
                                            ClipboardData(text: codigo));
                                        final snackBar = SnackBar(
                                          backgroundColor: primaryGreen,
                                          content:
                                              Text("Copiado al Portapapeles"),
                                          action: SnackBarAction(
                                            textColor: Colors.white,
                                            label: 'Cerrar',
                                            onPressed: () {},
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
