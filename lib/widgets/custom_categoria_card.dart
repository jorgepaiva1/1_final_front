
import 'package:flutter/material.dart';
import 'package:project_frontend_2/screens/editar_categoria_screen.dart';
import 'package:project_frontend_2/services/categoria_service.dart';

import '../theme/app_theme.dart';

class CustomCategoriaCard extends StatelessWidget {
  final int? idCategoria;
  final String? nombre;


  const CustomCategoriaCard({
    Key? key,
    this.idCategoria,
    this.nombre,

  }) : super(key: key);

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: idCategoria != null
              ? Text('$idCategoria')
              : const Text('Categoria'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Datos de la Categoria'),
              const SizedBox(height: 20),
              Text('Nombre: $nombre'),
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
                CategoriaService.eliminarCategoria(idCategoria); // Llamas a la función de cancelar reserva
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
            leading: const Icon(Icons.category, color: AppTheme.primary),
            title: Text("${idCategoria} "),
            subtitle: Text("Nombre : ${nombre ?? ''}"),
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
                      builder: (context) => EditarCategoriaScreen(idCategoria: idCategoria,),)
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