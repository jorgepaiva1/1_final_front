import 'package:flutter/material.dart';
import 'package:project_frontend_2/models/categoria.dart';
import 'package:project_frontend_2/services/services.dart';
import 'package:project_frontend_2/theme/app_theme.dart';
import 'package:project_frontend_2/widgets/custom_categoria_card.dart';

class CategoriaScreen extends StatefulWidget {
  const CategoriaScreen({super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreen();
}

class _CategoriaScreen extends State<CategoriaScreen> {
  late Future<List<Categoria>> _listadoCategoria;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    //Aqui se llama al servicio para obtener los pacientes
    _listadoCategoria = CategoriaService.getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoria'),
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
                    hintText: 'Buscar Categoria',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: ((value) =>
                  {
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
                future: _listadoCategoria,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (_searchText == '') {
                          return CustomCategoriaCard(
                            idCategoria: snapshot.data![index].idCategoria,
                            nombre: snapshot.data![index].nombre,
                          );
                        } else {
                            return Container();
                          }
                        }
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error al obtener las categorias');
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
          Navigator.pushNamed(context, 'AgregarCategoria');
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
