// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:blunder_store_app/screens/forgot_password.dart';
import 'package:blunder_store_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blunder_store_app/constants.dart';
import 'package:blunder_store_app/api.dart';
import 'package:blunder_store_app/screens/snackbar.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _rememberMe = false;
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final userTypeController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  late Future<bool> value;

  Widget buildEmailTF(controller) {
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
      ],
    );
  }

  Widget _buildEntryTF(String texto, controller) {
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
                Icons.email,
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

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipOval(
            child: Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/SA 1.png',
                width: 100,
                height: 100,
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
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextField(
            controller: controller,
            obscureText: true,
            style: TextStyle(
              color: Color(0xFFB8B8B8),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFB5B5B5),
              ),
              hintText: 'Escribe tu contraseña',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF(controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextField(
            controller: controller,
            obscureText: true,
            style: TextStyle(
              color: Color(0xFFB8B8B8),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFB5B5B5),
              ),
              hintText: 'Confirma tu contraseña',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: 200,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          if (emailController.text != "" &&
              phoneController.text != "" &&
              nameController.text != "" &&
              lastNameController.text != "" &&
              passwordController.text != "" &&
              passwordConfirmController.text != "")
            {
              if (passwordConfirmController.text == passwordController.text)
                createUser(
                        emailController.text,
                        phoneController.text,
                        nameController.text,
                        lastNameController.text,
                        passwordController.text)
                    .then((value) => {
                          if (value)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }),
                              ),
                            }
                          else
                            {
                              showMessage(
                                  "Ocurrio un error al momento de crear el usuario",
                                  context),
                            }
                        })
              else
                showMessage("Las contraseñas no coinciden", context),
            }
          else
            showMessage("Falta algun campo por completar", context),
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Color(0xFF009C8A),
        child: Text(
          'Registrarse',
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
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Regístrate',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        _buildNombreApellido("Nombres", nameController,
                            "Apellidos", lastNameController),

                        // _buildEntryTF("UserType", userTypeController),
                        buildEmailTF(emailController),
                        _buildEntryTF("Escribe tu Teléfono", phoneController),
                        _buildPasswordTF(passwordController),
                        _buildConfirmPasswordTF(passwordConfirmController),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildRegisterBtn(context),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLoginBtn(context),
                          ],
                        ),

                        //_buildSignInWithText(),
                        //_buildSocialBtnRow(),
                        //_buildSignupBtn(),
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

Widget _buildForgotPasswordBtn(context) {
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

Widget _buildLoginBtn(context) {
  return Container(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(right: 0.0),
      child: TextButton(
        // ignore: avoid_print
        onPressed: () => {
          print('Login Button Pressed'),
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
