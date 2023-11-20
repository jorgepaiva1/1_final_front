import 'package:flutter/material.dart';
import 'package:project_frontend_2/models/cliente.dart';
import 'package:project_frontend_2/services/services.dart';
import 'package:project_frontend_2/theme/app_theme.dart';
import 'package:project_frontend_2/widgets/custom_cliente_card.dart';

class ClienteScreen extends StatefulWidget {
  const ClienteScreen({super.key});

  @override
  State<ClienteScreen> createState() => _ClienteScreen();
}

class _ClienteScreen extends State<ClienteScreen> {
  late Future<List<Cliente>> _listadoClientes;
  String _searchText = '';
  @override
  void initState() {
    super.initState();
    //Aqui se llama al servicio para obtener los pacientes
    _listadoClientes = ClienteService.getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
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
                    hintText: 'Buscar cliente',
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
                future: _listadoClientes,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (_searchText == '') {
                          return CustomClienteCard(
                            id: snapshot.data![index].id,
                            nombre: snapshot.data![index].nombre,
                            apellido: snapshot.data![index].apellido,
                            telefono: snapshot.data![index].telefono,
                            email: snapshot.data![index].email,
                            ruc: snapshot.data![index].ruc,
                            cedula: snapshot.data![index].cedula,

                          );
                        } else {
                          if (snapshot.data![index].nombre!.toLowerCase().contains(_searchText.toLowerCase()) ||
                              (snapshot.data![index].apellido != null &&
                                  snapshot.data![index].apellido!.toLowerCase().contains(_searchText.toLowerCase()))) {
                            return CustomClienteCard(
                              id: snapshot.data![index].id,
                              nombre: snapshot.data![index].nombre,
                              apellido: snapshot.data![index].apellido,
                              telefono: snapshot.data![index].telefono,
                              email: snapshot.data![index].email,
                              ruc: snapshot.data![index].ruc,
                              cedula: snapshot.data![index].cedula,

                            );
                          } else {
                            return Container();
                          }
                        }
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error al obtener los clientes');
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
          Navigator.pushNamed(context, 'AgregarCliente');
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
