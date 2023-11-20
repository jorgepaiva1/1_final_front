import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/cliente_service.dart';
import 'package:project_frontend_2/widgets/custom_input_field.dart';

class AgregarClienteScreen extends StatelessWidget {
  const AgregarClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nombre': '',
      'apellido': '',
      'email': '',
      'telefono': '',
      'ruc': '',
      'cedula': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Cliente'),
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
                  icon: Icons.person,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Apellido',
                  hintText: 'Apellido',
                  labelText: 'Apellido',
                  formProperty: 'apellido',
                  icon: Icons.person,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Email',
                  hintText: 'Email',
                  labelText: 'Email',
                  formProperty: 'email',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Telefono',
                  hintText: 'Telefono',
                  labelText: 'Telefono',
                  formProperty: 'telefono',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'RUC',
                  hintText: 'RUC',
                  labelText: 'RUC',
                  formProperty: 'ruc',
                  icon: Icons.document_scanner,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  helperText: 'Cedula',
                  hintText: 'Cedula',
                  labelText: 'Cedula',
                  formProperty: 'cedula',
                  icon: Icons.credit_card,
                  formValues: formValues,
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    late Future<String> respuesta = ClienteService.agregarCliente(formValues);
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
                                content: Text('Error al agregar cliente'),
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
