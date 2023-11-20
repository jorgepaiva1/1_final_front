import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/categoria_service.dart';
import 'package:project_frontend_2/widgets/custom_input_field.dart';

class AgregarCategoriaScreen extends StatelessWidget {
  const AgregarCategoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nombre': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Categoria'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(
                  helperText: 'Nombre',
                  hintText: 'Nombre',
                  labelText: 'Nombre',
                  formProperty: 'nombre',
                  icon: Icons.category,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    late Future<String> respuesta = CategoriaService.agregarCategoria(formValues);
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
                                content: Text('Error al agregar categoria'),
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
