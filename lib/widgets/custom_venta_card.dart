// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:project_frontend_2/screens/editar_venta_screen.dart';

import '../theme/app_theme.dart';
import 'package:project_frontend_2/services/venta_service.dart';

class CustomVentaCard extends StatelessWidget {
  final int? idVenta;
  final int? nroFactura;
  final String? fecha;
  final String? total;
  final int? idProducto;
  final int? cantidad;

  const CustomVentaCard({
    Key? key,
    this.idVenta,
    this.nroFactura,
    this.fecha,
    this.total,
    this.idProducto,
    this.cantidad,
  }) : super(key: key);

  //Agregamos el campo de informacion de un cliente en un modal
  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: Text('$idVenta'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Datos de la Venta'),
              const SizedBox(height: 20),
              Text('ID: $idVenta'),
              Text('Numero de Factura: $nroFactura'),
              Text('Fecha: $fecha'),
              Text('ID Producto: $idProducto'),
              Text('Cantidad: $cantidad'),
              Text('Total: $total'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
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
                VentaService.EliminarVenta(idVenta); // Llamas a la función de cancelar reserva
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
            leading: const Icon(Icons.article, color: AppTheme.primary),
            title: Text("ID: ${idVenta}"),
            subtitle: Text("Total: ${total ?? ''}"),
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
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditarVentaScreen(idVenta: idVenta,),)
                    );
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
