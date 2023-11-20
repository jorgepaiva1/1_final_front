// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/cliente_service.dart';

import '../screens/editarCliente.dart';
import '../theme/app_theme.dart';

class CustomClienteCard extends StatelessWidget {
  final int? id;
  final String? nombre;
  final String? apellido;
  final String? telefono;
  final String? email;
  final String? ruc;
  final String? cedula;

  const CustomClienteCard({
    Key? key,
    this.id,
    this.nombre,
    this.apellido,
    this.telefono,
    this.email,
    this.ruc,
    this.cedula,
  }) : super(key: key);

  //Agregamos el campo de informacion de un cliente en un modal
  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: nombre != null
              ? Text('$nombre $apellido')
              : const Text('Paciente'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Datos del cliente'),
              const SizedBox(height: 20),
              Text('Telefono: $telefono'),
              Text('Email: $email'),
              Text('Ruc: $ruc'),
              Text('Cedula: $cedula'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
              const Text('Cancelar', style: TextStyle(color: Colors.red)),
            )
          ],
        );
      },
    );
  }

  void displayDialogCancelar(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Estas seguro que desea eliminar'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          actions: [
            TextButton(
              onPressed: () {
                ClienteService.EliminarCliente(id); // Llamas a la función de cancelar reserva
                Navigator.pushNamed(context, 'home'); // Cierras la pantalla actual y vuelves a la pantalla anterior
              },
              child: const Text('Si', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            )
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: AppTheme.primary),
            title: Text("${nombre} ${apellido}"),
            subtitle: Text("Telefono : ${telefono ?? ''}"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => displayDialogAndroid(context),
                  child: const Text(
                    'Informacion',
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActualizarClienteScreen(
                            id: id,
                          ),
                        ));
                  },
                  child: const Text(
                    'Editar',
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
                TextButton(
                  onPressed: () => displayDialogCancelar(context),
                  child: const Text(
                    'Eliminar',
                    style: TextStyle(color: Color.fromARGB(255, 196, 19, 19)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}