import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_frontend_2/models/models.dart';

int p = 3;
class ClienteService {


  static Future<List<Cliente>> getClientes() async {
    return Cliente.clientes;
  }

  static Future<String> agregarCliente(Map<String, String> formValues) async {

    // Agrega el nuevo paciente a la variable local
    Cliente.nuevosClientes.add(Cliente(
      id: p,
      nombre: formValues['nombre'],
      apellido: formValues['apellido'],
      telefono: formValues['telefono'],
      email: formValues['email'],
      ruc: formValues['ruc'],
      cedula: formValues['cedula'],
    ));
    Cliente.clientes.addAll(Cliente.nuevosClientes);
    Cliente.nuevosClientes.clear();
    p++;
    return 'OK';
  }

  static Future<String> actualizarCliente(
      Map<String, String> formValues) async {

    int id = int.parse(formValues['id']!);
    final cliente = Cliente.clientes.where((f) => f.id == id).first;

    cliente.nombre = formValues['nombre'];
    cliente.apellido = formValues['apellido'];
    cliente.telefono = formValues['telefono'];
    cliente.email = formValues['email'];
    cliente.ruc = formValues['ruc'];
    cliente.cedula = formValues['cedula'];

    return 'OK';

  }

  static Future<String> EliminarCliente(int? cliente) async {

    for (int i=0; i<Cliente.clientes.length; i++) {
      if (cliente == Cliente.clientes[i].id) {
        Cliente.clientes.removeAt(i);
      }
    }

    return 'OK';
  }

}
