import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:form_validation_app/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://wallapop-8d0ba.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';
    final resp = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}
