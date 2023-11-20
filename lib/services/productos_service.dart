import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_frontend_2/models/models.dart';

int d = 3;
class ProductoService {


  static Future<List<Producto>> getProductos() async {
    return Producto.productos;
  }

  static Future<String> agregarProducto(Map<String, String> formValues) async {

    // Agrega el nuevo paciente a la variable local
    Producto.nuevosProductos.add(Producto(
      id: d,
      codigo: formValues['codigo'],
      nombreProducto: formValues['nombreProducto'],
      idCategoria: formValues['idCategoria'],
      precioVenta: formValues['precioVenta'],

    ));
    Producto.productos.addAll(Producto.nuevosProductos);
    Producto.nuevosProductos.clear();
    d++;
    return 'OK';
  }

  static Future<String> actualizarProducto(
      Map<String, String> formValues) async {

    int id = int.parse(formValues['id']!);
    final persona = Producto.productos.where((f) => f.id == id).first;

    persona.codigo = formValues['codigo'];
    persona.nombreProducto = formValues['nombreProducto'];
    persona.idCategoria = formValues['idCategoria'];
    persona.precioVenta = formValues['precioVenta'];

    return 'OK';

  }

  static Future<String> EliminarProducto(int? producto) async {

    for (int i=0; i<Producto.productos.length; i++) {
      if (producto == Producto.productos[i].id) {
        Producto.productos.removeAt(i);
      }
    }

    return 'OK';
  }

}
