// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/productos_service.dart';

import '../screens/editarProducto.dart';
import '../theme/app_theme.dart';

class CustomProductoCard extends StatelessWidget {
  final int? id;
  final String? codigo;
  final String? nombreProducto;
  final String? idCategoria;
  final String? precioVenta;

  const CustomProductoCard({
    Key? key,
    this.id,
    this.codigo,
    this.nombreProducto,
    this.idCategoria,
    this.precioVenta,

  }) : super(key: key);

  //Agregamos el campo de informacion de un cliente en un modal
  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: codigo != null
              ? Text('$codigo')
              : const Text('Producto'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Datos del producto'),
              const SizedBox(height: 20),
              Text('Codigo: $codigo'),
              Text('Nombre del producto: $nombreProducto'),
              Text('Id de Categoria: $idCategoria'),
              Text('Precio de venta: $precioVenta'),
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
                ProductoService.EliminarProducto(id); // Llamas a la función de cancelar reserva
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
            title: Text("${codigo}"),
            subtitle: Text("Nombre del producto : ${nombreProducto ?? ''}"),
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
                          builder: (context) => ActualizarProductoScreen(
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