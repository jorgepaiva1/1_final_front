import 'package:flutter/material.dart';
import 'package:project_frontend_2/models/models.dart';
import 'package:project_frontend_2/routes/categoria_routes.dart';
import 'package:project_frontend_2/routes/reserva_routes.dart';
import 'package:project_frontend_2/routes/productos_routes.dart';

import '../screens/screens.dart';
import 'clientes_routes.dart';
import 'venta_routes.dart';

class AppRoutes {
  static const initialRoute = 'login';

  //Aqui dentro agregamos las opciones del menu
  static final menuOptions = <MenuOption>[
    const MenuOption(
      name: 'Categorias',
      icon: Icons.book,
      route: 'categorias',
      screen: CategoriaScreen(),
    ),
    const MenuOption(
      name: 'Producto',
      icon: Icons.trolley,
      route: 'producto',
      screen: ProductoScreen(),
    ),
    const MenuOption(
      name: 'Clientes',
      icon: Icons.person,
      route: 'clientes',
      screen: ClienteScreen(),
    ),

    const MenuOption(
      name: 'Venta',
      icon: Icons.shopping_cart,
      route: 'venta',
      screen: VentaScreen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    //Agregamos todas las rutas para la pantalla

    for (final option in CategoriaRoutes.rutas) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    for (final option in ClienteRoutes.rutas) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    for (final option in ProductoRoutes.rutas) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    for (final option in VentaRoutes.rutas) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }


    //Agregamos la pantalla de home como una ruta
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    );
  }
}
