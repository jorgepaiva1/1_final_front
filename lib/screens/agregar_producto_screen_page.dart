import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/productos_service.dart';
import 'package:project_frontend_2/widgets/custom_input_field.dart';

class AgregarProductoScreen extends StatelessWidget {
  const AgregarProductoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'codigo': '',
      'nombreProducto': '',
      'idCategoria': '',
      'precioVenta': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Producto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
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
                    late Future<String> respuesta = ProductoService.agregarProducto(formValues);
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
                                content: Text('Error al agregar el producto'),
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
