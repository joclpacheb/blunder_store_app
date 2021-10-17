
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

class Product{
  final String id;
  final String name;
  final String description;
  final double price;
  final String type;
  final int stock;
  final double point;
  final bool productBlunder;
  final bool status;
  final List<dynamic> pictures;

  Product({
    required this.id,
    required this.name, 
    required this.description,
    required this.price,
    required this.type,
    required this.stock,
    required this.point,
    required this.productBlunder,
    required this.status,
    required this.pictures
  });

  factory Product.fromJson(Map<String, dynamic> json){
        return Product( 
          id : json['id'] as String,
          name : json['nombre'] as String,
          description : json['descripcion'] ?? '',
          price : json['precio'] as double,
          type : json['tipo'] as String,
          stock : json['stock'] as int,
          point : json['puntuacion'] ?? 0 as double,
          productBlunder : json['producto_blunder'] as bool,
          status : json['estatus'] as bool,
          pictures : json['fotos'] as List<dynamic>
        ) ;
  }
      

  Map<String, dynamic> toJson() => {
        'id' : id,
        'name' : name,
        'description' : description,
        'price' : price,
        'type' : type,
        'stock' : stock,
        'point' : point,
        'productBlunder' : productBlunder,
        'status' : status,
        'pictures': pictures
      };
}

Future<List<Product>> getProducts() async{
  try {
    var url = Uri.parse(urlBase + "productos?status=true");
    var response = await http.get(url);
    // print('status: ${response.statusCode}.');
    // print('body: ${response.body}');
    if(response.statusCode == 200){
      // print(convert.json.decode(response.body).map((data) => Product.fromJson(data)));
      var value = convert.jsonDecode(response.body);
      final parsed = convert.jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
      final list = parsed.map<Product>((json) => Product.fromJson(json)).toList();

      return list;
    }
    else
      throw Exception('Failed to load products');

  } on Exception catch(e) {
    print('error caught: $e');
    return [];
  }
    
}


List<Product> parseProducts(String responseBody) {

  final parsed = convert.jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}


