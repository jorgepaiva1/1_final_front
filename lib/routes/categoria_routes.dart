import 'package:flutter/material.dart';
import 'package:project_frontend_2/models/models.dart';

import '../screens/screens.dart';
// Creamos un Map donde colocamos todas las rutas que requiere la pantalla de pacientes

// Ejemplo de como definir rutas especifica para una pantalla especifica
class CategoriaRoutes {
  static final rutas = <MenuOption>[
    const MenuOption(
      name: 'Agregar Categoria',
      icon: Icons.person_add,
      route: 'AgregarCategoria',
      screen: AgregarCategoriaScreen(),
    ),
    const MenuOption(
      name: 'Editar Categoria',
      icon: Icons.person_add,
      route: 'EditarCategoria',
      screen: EditarCategoriaScreen(),
    ),
  ];
}
