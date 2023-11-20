import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/productos_service.dart';
import 'package:project_frontend_2/widgets/custom_input_field.dart';

class ActualizarProductoScreen extends StatelessWidget {
  final int? id;

  const ActualizarProductoScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'id': id.toString(),
      'codigo': '',
      'nombreProducto': '',
      'idCategoria': '',
      'precioVenta': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text('Datos del producto'),
                const SizedBox(height: 20),
                CustomInputField(
                  helperText: '$id',
                  hintText: '$id',
                  labelText: '$id',
                  formProperty: 'id',
                  enabled: false,
                  icon: Icons.numbers,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Codigo',
                  hintText: 'Codigo',
                  labelText: 'Codigo',
                  formProperty: 'codigo',
                  icon: Icons.numbers,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Nombre del producto',
                  hintText: 'Nombre del producto',
                  labelText: 'Nombre del producto',
                  formProperty: 'nombreProducto',
                  icon: Icons.trolley,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Id Categoria',
                  hintText: 'Id Categoria',
                  labelText: 'Id Categoria',
                  formProperty: 'idCategoria',
                  icon: Icons.category,
                  keyboardType: TextInputType.emailAddress,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Precio de Venta',
                  hintText: 'Precio de Venta',
                  labelText: 'Precio de Venta',
                  formProperty: 'precioVenta',
                  icon: Icons.attach_money,
                  keyboardType: TextInputType.phone,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    late Future<String> respuesta =
                    ProductoService.actualizarProducto(formValues);
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
                                content: Text('Error al editar el prodcuto'),
                              ),
                            )
                          }
                      },
                    );
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}