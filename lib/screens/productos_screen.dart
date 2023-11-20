import 'package:flutter/material.dart';
import 'package:project_frontend_2/models/producto.dart';
import 'package:project_frontend_2/services/services.dart';
import 'package:project_frontend_2/theme/app_theme.dart';
import 'package:project_frontend_2/widgets/custom_producto_card.dart';

class ProductoScreen extends StatefulWidget {
  const ProductoScreen({super.key});

  @override
  State<ProductoScreen> createState() => _ProductoScreen();
}

class _ProductoScreen extends State<ProductoScreen> {
  late Future<List<Producto>> _listadoProductos;
  String _searchText = '';
  @override
  void initState() {
    super.initState();
    //Aqui se llama al servicio para obtener los pacientes
    _listadoProductos = ProductoService.getProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //Agregamos un inputfield que actualiza un valor a _searchText
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Buscar Producto',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: ((value) => {
                        setState(
                          (() => {_searchText = value}),
                        )
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: _listadoProductos,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (_searchText == '') {
                          return CustomProductoCard(
                            id: snapshot.data![index].id,
                            codigo: snapshot.data![index].codigo,
                            nombreProducto: snapshot.data![index].nombreProducto,
                            idCategoria: snapshot.data![index].idCategoria,
                            precioVenta: snapshot.data![index].precioVenta,

                          );
                        } else {
                          if (snapshot.data![index].codigo!.toLowerCase().contains(_searchText.toLowerCase()) ||
                              (snapshot.data![index].nombreProducto != null &&
                                  snapshot.data![index].nombreProducto!.toLowerCase().contains(_searchText.toLowerCase()))) {
                            return CustomProductoCard(
                              id: snapshot.data![index].id,
                              codigo: snapshot.data![index].codigo,
                              nombreProducto: snapshot.data![index].nombreProducto,
                              idCategoria: snapshot.data![index].idCategoria,
                              precioVenta: snapshot.data![index].precioVenta,

                            );
                          } else {
                            return Container();
                          }
                        }
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error al obtener los productos');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'agregarProducto');
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
