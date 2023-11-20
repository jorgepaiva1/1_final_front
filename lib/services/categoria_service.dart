import 'dart:convert';
import 'package:project_frontend_2/models/models.dart';

int c=3;

class CategoriaService {
  static Future<List<Categoria>> getCategorias() async {
    return Categoria.categorias;
  }

  static Future<String> agregarCategoria(Map<String, String> formValues) async {
    Categoria.nuevasCategorias.add(Categoria(
      idCategoria: c,
      nombre: formValues['nombre'],
    ));
    Categoria.categorias.addAll(Categoria.nuevasCategorias);
    Categoria.nuevasCategorias.clear();

    return 'OK';
  }

  static Future<String> editarCategoria(Map<String, String> formValues) async {

    int? idCategoria = int.parse(formValues['idCategoria']!);
    final categoria = Categoria.categorias.where((f) => f.idCategoria == idCategoria).first;

// Edita la ficha con los valores del formulario
    categoria.nombre = formValues['nombre'];


// Devuelve un mensaje de éxito
    return 'OK';
  }

  static Future<String> eliminarCategoria(int? categoria) async {

    for (int i=0; i<Categoria.categorias.length; i++) {
      if (categoria == Categoria.categorias[i].idCategoria) {
        Categoria.categorias.removeAt(i);
      }
    }

    return 'OK';
  }
}
