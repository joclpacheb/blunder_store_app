// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'dart:html';
import 'dart:js';

import 'package:blunder_store_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/api.dart';

class forgotScreen extends StatefulWidget {
  @override
  _forgotScreenState createState() => _forgotScreenState();
}

class _forgotScreenState extends State<forgotScreen> {
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
          padding:
              const EdgeInsets.only(left: 30.0, right: 30, bottom: 10, top: 5),
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
                hintText: 'Escribe tu email',
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
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 179,
            height: 85,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/blunder_w.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: 200,
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
              ),
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
          'Enviar',
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
                  padding: const EdgeInsets.fromLTRB(0, 140, 0, 00),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // ignore: prefer_const_constructors

                        Text(
                          'Recuperar Contraseña',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),

                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Text(
                            'Se te enviará un link a tu correo electrónico para recuperar la contraseña.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        buildEmailTF(emailController),

                        _buildRegisterBtn(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLoginBtn(context),
                          ],
                        ),
                        Container(
                          height: 165,
                          width: 162,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/images/abducted.png',
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          '© 2021 Cyberpunk UCLA DCYT',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 14.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

Widget _buildLoginBtn(context) {
  return Container(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(right: 0.0),
      child: TextButton(
        // ignore: avoid_print
        onPressed: () => {
          print(' Button login Pressed'),
          //aqui va la validación con la API para el login
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }),
          ),
        },
        child: Text('Iniciar Sesión',
            style: TextStyle(
              color: fondoDark,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
            )),
      ),
    ),
  );
}
