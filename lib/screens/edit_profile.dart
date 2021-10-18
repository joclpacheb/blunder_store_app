// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'dart:html';
import 'dart:js';

import 'package:blunder_store_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/api.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  bool _rememberMe = false;
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final userTypeController = TextEditingController();
  final passwordController = TextEditingController();
  late Future<bool> value;

  Widget buildEmailTF(controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 40.0,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Color(0xFFB8B8B8),
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 10.0),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Color(0xFFB5B5B5),
                ),
                hintText: 'johndoe@gmail.com',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 150,
            height: 55,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/blunder_w.png',
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      width: 150,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          if (emailController.text != "" &&
              phoneController.text != "" &&
              nameController.text != "" &&
              lastNameController.text != "" &&
              passwordController.text != "" &&
              userTypeController.text != "")
            {
              value = createUser(
                  emailController.text,
                  phoneController.text,
                  nameController.text,
                  lastNameController.text,
                  passwordController.text,
                  userTypeController.text),
              FutureBuilder(
                  future: value,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("creado");
                      return Text("creado");
                    } else if (snapshot.hasError) {
                      print("error");
                      return Text("error");
                    }
                    return Text("funciona");
                  })
            }
          else
            print("jdklasfjkdsjfkl")
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Color(0xFF009C8A),
        child: Text(
          'Aceptar',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildCancelBtn(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      width: 150,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.of(context).pop(false),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: rojoBlunder,
        child: Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildAdressBtn(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: fondoDark,
            padding: EdgeInsets.all(20),
            side: BorderSide(width: 2.0, color: rojoBlunder),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        onPressed: () {},
        child: Text(
          'Direcciones',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: rojoBlunder),
        ),
      ),
    );
  }

  Widget _buildPassChangeBtn(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 2),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: fondoDark,
            padding: EdgeInsets.all(20),
            side: BorderSide(width: 2.0, color: rojoBlunder),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        onPressed: () {},
        child: Text(
          'Cambiar Contraseña',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: rojoBlunder),
        ),
      ),
    );
  }

//=============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(
                    0xff313131,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Color(
                    0xff009c8a,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      0,
                    ),
                    topRight: Radius.circular(
                      0,
                    ),
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    bottomRight: Radius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              _buildLogo(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: const BoxDecoration(
                      color: Color(
                        0xffffffff,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          20,
                        ),
                        topRight: Radius.circular(
                          20,
                        ),
                        bottomLeft: Radius.circular(
                          20,
                        ),
                        bottomRight: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Modificar Perfil ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // ignore: prefer_const_constructors
                        _buildNombreApellido(
                            "John", nameController, "Doe", lastNameController),
                        buildEmailTF(emailController),
                        _buildTelephone("+584145134870", phoneController),

                        _buildAdressBtn(context),
                        _buildPassChangeBtn(context),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 20.0, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCancelBtn(context),
                              _buildChangeBtn(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildNombreApellido(
    String texto_n, controller_n, texto_a, controller_a) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 10.0),
      Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 40.0,
                child: TextField(
                  controller: controller_n,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Color(0xFFB8B8B8),
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 10.0),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFFB5B5B5),
                    ),
                    hintText: texto_n,
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 40.0,
                child: TextField(
                  controller: controller_a,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Color(0xFFB8B8B8),
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 10.0),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFFB5B5B5),
                    ),
                    hintText: texto_a,
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTelephone(String texto, controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 40.0,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: Color(0xFFB8B8B8),
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 10.0),
            prefixIcon: const Icon(
              Icons.phone,
              color: Color(0xFFB5B5B5),
            ),
            hintText: texto,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}
