import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/venta_service.dart';
import 'package:project_frontend_2/widgets/custom_input_field.dart';

class AgregarVentaScreen extends StatelessWidget {
  const AgregarVentaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nroFactura': '',
      'fecha': '',
      'total': '',
      'idProducto': '',
      'cantidad': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Venta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(
                  helperText: 'Numero de Factura',
                  hintText: 'Numero de Factura',
                  labelText: 'Numero de Factura',
                  formProperty: 'nroFactura',
                  icon: Icons.numbers,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Fecha',
                  hintText: 'Fecha',
                  labelText: 'Fecha',
                  formProperty: 'fecha',
                  icon: Icons.date_range,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'ID Producto',
                  hintText: 'ID Producto',
                  labelText: 'ID Producto',
                  formProperty: 'idProducto',
                  icon: Icons.numbers,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Cantidad',
                  hintText: 'Cantidad',
                  labelText: 'Cantidad',
                  formProperty: 'cantidad',
                  icon: Icons.format_list_numbered,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    late Future<String> respuesta = VentaService.agregarVenta(formValues);
                    respuesta.then(
                      (value) => {
                        if (value == 'OK')
                          {
                            Navigator.pushNamed(context, 'home'),
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error al agregar venta'),
                              ),
                            )
                          }
                      },
                    );
                  },
                  child: const Text('Agregar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
