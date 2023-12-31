import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_frontend_2/models/models.dart';

class LoginService {
  static String url = 'equipoyosh.com';

  static Future<int> iniciarSecion(Map<String, String> formValues) async {
    Cliente clienteActual;

    Uri uri = Uri.http(url, '/stock-nutrinatalia/persona');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var item in data['lista']) {
        clienteActual = Cliente(
          id: item["idPersona"],
          apellido: item["apellido"],
          cedula: item["cedula"],
          email: item["email"],
          nombre: item["nombre"],
          ruc: item["ruc"],
          telefono: item["telefono"],
        );

        if ('12345' == formValues['contrasena']) {
          return 1;
        }
      }

      return 0;
    } else {
      return 0;
    }
  }
}

