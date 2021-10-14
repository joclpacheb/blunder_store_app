import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const urlBase = "https://blunderstore.herokuapp.com/api/v1/";


Future<bool> createUser(String email, String phone,
 String name, String lastName, String password, String userType) async{

  var url = Uri.parse(urlBase + "usuarios");
  var response = await http.post(url, body: {"correo": email,
  "contraseña": password,
  "nombres": name,
  "apellidos": lastName,
  "telefono": phone,
  "tipo_usuario": userType
  });
  print('status: ${response.statusCode}.');
  print('body: ${response.body}');
  if(response.statusCode == 200){
    return true;
  }
  return false;

}
