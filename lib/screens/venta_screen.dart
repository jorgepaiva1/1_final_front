import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:project_frontend_2/widgets/custom_venta_card.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/models.dart';
import '../services/venta_service.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../theme/app_theme.dart';

void main() => runApp(const VentaScreen());

class VentaScreen extends StatefulWidget {
  const VentaScreen({super.key});

  @override
  State<VentaScreen> createState() => _VentaScreen();
}

class _VentaScreen extends State<VentaScreen> {
  late Future<List<Venta>> _listadoVenta;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    //Aqui se llama al servicio para obtener los pacientes
    _listadoVenta = VentaService.getVentas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas'),
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
                    hintText: 'Buscar Venta',
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
                future: _listadoVenta,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          if (_searchText == '') {
                            return CustomVentaCard(
                              idVenta: snapshot.data![index].idVenta,
                              nroFactura: snapshot.data![index].nroFactura,
                              fecha: snapshot.data![index].fecha,
                              total: snapshot.data![index].total,
                              idProducto: snapshot.data![index].idProducto,
                              cantidad: snapshot.data![index].cantidad,
                            );
                          } else {
                            return Container();
                          }
                        }
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error al obtener las ventas');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.picture_as_pdf),
            label: 'Generar PDF',
            onTap: () async {
              final pdf = pw.Document();

              pdf.addPage(
                pw.Page(
                  build: (pw.Context context) =>
                      pw.Table.fromTextArray(
                        context: context,
                        data: <List<String>>[
                          <String>['ID Venta', 'Nro Factura', 'Fecha', 'ID Producto', 'Cantidad', 'Total'],
                          ...Venta.ventas.map((venta) => [venta.idVenta.toString(), venta.nroFactura.toString(), venta.fecha!, venta.idProducto.toString(), venta.cantidad.toString(), venta.total!])
                        ],
                      ),
                      ),
              );

              await Printing.layoutPdf(
                onLayout: (PdfPageFormat format) async => pdf.save(),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            label: 'Agregar Venta',
            onTap: () {
              Navigator.pushNamed(context, 'AgregarVenta');
            },
          ),
        ],
      ),
    );
  }
}