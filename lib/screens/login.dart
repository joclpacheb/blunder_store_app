// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/screens/main_shop.dart';
import 'package:blunder_store_app/screens/register.dart';
import 'package:blunder_store_app/screens/snackbar.dart';
import 'package:blunder_store_app/api.dart';
import 'forgot_password.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    getToken().then((value) => {
      if(value != ""){
        token =value,
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MainShop();
          }),
        ),
      }
    });
  }
  bool _rememberMe = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late Future<bool> value;

  Widget buildEmailTF(controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Color(0xFFB8B8B8),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.email,
                color: Color(0xFFB5B5B5),
              ),
              hintText: 'Escribe aquí tu email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
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

  Widget _buildPasswordTF(controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: controller,
            obscureText: true,
            style: TextStyle(
              color: Color(0xFFB8B8B8),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFB5B5B5),
              ),
              hintText: 'Escribe aquí tu contraseña',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 0.0),
        child: TextButton(
          // ignore: avoid_print
          onPressed: () => {
            print('Forgot Button Pressed'),
            //aqui va la validación con la API para el login
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return forgotScreen();
              }),
            ),
          },
          child: Text('¿Olvidaste la contraseña?',
              style: TextStyle(
                color: fondoDark,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              )),
        ),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 0.0),
        child: TextButton(
          // ignore: avoid_print
          onPressed: () => {
            print(' Button register Pressed'),
            //aqui va la validación con la API para el login
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return RegisterScreen();
              }),
            ),
          },
          child: Text('|    Registrate',
              style: TextStyle(
                color: fondoDark,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              )),
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 200,
      height: 100,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          
          if (emailController.text != "" &&
              passwordController.text != "")
            {
              auth(emailController.text, passwordController.text).then((value) => {
                if(value){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MainShop();
                      }),
                    ),
                }else {
                  showMessage("El correo o el la contraseña no son correctos", context),
                }
              }),    
          }
          else
            showMessage("Falta por llenar el correo o la contraseña", context),
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Color(0xFF009C8A),
        child: Text(
          'Iniciar',
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

  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 15.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Recuérdame',
            style: kLabelStyle,
          ),
        ],
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
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    width: 500,
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
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        buildEmailTF(emailController),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildPasswordTF(passwordController),
                        SizedBox(
                          height: 15.0,
                        ),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildForgotPasswordBtn(),
                            _buildRegisterBtn(),
                          ],
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
