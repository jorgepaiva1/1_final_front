import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_frontend_2/models/models.dart';

int v = 3;
class VentaService {


  static Future<List<Venta>> getVentas() async {
      return Venta.ventas;
  }

  static Future<String> agregarVenta(Map<String, String> formValues) async {

    Venta.nuevasVentas.add(Venta(
      idVenta: v,
      nroFactura: int.parse(formValues['nroFactura']!),
      fecha: formValues['fecha'],
      total: (int.parse(formValues['cantidad']!) *6700).toString(),
      idProducto: int.parse(formValues['idProducto']!),
      cantidad: int.parse(formValues['cantidad']!),

    ));
    Venta.ventas.addAll(Venta.nuevasVentas);
    Venta.nuevasVentas.clear();

    v++;
// Devuelve un mensaje de éxito
    return 'OK';

  }

  static Future<String> editarVenta(Map<String, String> formValues) async {


    int? idVenta = int.parse(formValues['idVenta']!);
    final venta = Venta.ventas.where((f) => f.idVenta == idVenta).first;

// Edita la ficha con los valores del formulario
    venta.fecha = formValues['fecha'];
    venta.total = (int.parse(formValues['cantidad']!) *6700).toString();
    venta.idProducto = int.parse(formValues['idProducto']!);
    venta.cantidad = int.parse(formValues['cantidad']!);

// Devuelve un mensaje de éxito
    return 'OK';
  }

  static Future<String> EliminarVenta(int? venta) async {

    for (int i=0; i<Venta.ventas.length; i++) {
      if (venta == Venta.ventas[i].idVenta) {
        Venta.ventas.removeAt(i);
      }
    }

    return 'OK';
  }
}
