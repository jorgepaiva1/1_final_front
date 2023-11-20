import 'package:flutter/material.dart';
import 'package:project_frontend_2/models/models.dart';

import '../screens/screens.dart';
// Creamos un Map donde colocamos todas las rutas que requiere la pantalla de pacientes

// Ejemplo de como definir rutas especifica para una pantalla especifica
class VentaRoutes {
  static final rutas = <MenuOption>[
    const MenuOption(
      name: 'Agregar Venta',
      icon: Icons.person_add,
      route: 'AgregarVenta',
      screen: AgregarVentaScreen(),
    ),
    const MenuOption(
      name: 'Editar Venta',
      icon: Icons.person_add,
      route: 'EditarVenta',
      screen: EditarVentaScreen(),
    ),
  ];
}
