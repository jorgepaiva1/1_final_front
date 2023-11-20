import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/categoria_service.dart';
import 'package:project_frontend_2/widgets/custom_input_field.dart';

class EditarCategoriaScreen extends StatelessWidget {

  final int? idCategoria;

  const EditarCategoriaScreen({super.key, this.idCategoria});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'idCategoria': idCategoria.toString(),
      'nombre': '',
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Categoria'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text('Datos de la Categoria'),
                const SizedBox(height: 20),
                CustomInputField(
                  helperText: '$idCategoria',
                  hintText: '$idCategoria',
                  labelText: '$idCategoria',
                  formProperty: 'idCategoria',
                  enabled: false,
                  icon: Icons.category,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'nombre',
                  hintText: 'nombre',
                  labelText: 'nombre',
                  formProperty: 'nombre',
                  icon: Icons.remove_red_eye,
                  formValues: formValues,
                ),
                ElevatedButton(
                  onPressed: () {
                    late Future<String> respuesta = CategoriaService
                        .editarCategoria(formValues);
                    respuesta.then(
                          (value) =>
                      {
                        if (value == 'OK')
                          {
                            Navigator.pushNamed(context, 'home'),
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error al editar la categoria'),
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