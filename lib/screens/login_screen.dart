import 'package:flutter/material.dart';
import 'package:project_frontend_2/services/services.dart';
import 'package:project_frontend_2/widgets/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'usuario': '',
      'contrasena': '',
    };

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Sistema venta productos',
                    style: Theme.of(context).textTheme.headline4,
                  ),

                  const SizedBox(),
                  ElevatedButton(
                      onLongPress: () {
                        displayDialogAndroid(context, null, null);
                      },
                      onPressed: () {
                        late Future<int> respuesta = LoginService.iniciarSecion(formValues);
                        respuesta.then((value) => {
                              if (value != 1)
                                {Navigator.pushNamed(context, 'home')}
                              else
                                {displayDialogAndroid(context, "Error", "Usuario o contraseña incorrectos")}
                            });
                      },
                      child: const Text('Ingresar')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void displayDialogAndroid(BuildContext context, String? titulo, String? mensaje) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: titulo == null ? const Text('Entrar') : Text(titulo),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
          content: mensaje == null ? const Text('Entrar') : Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
