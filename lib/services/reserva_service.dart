import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_frontend_2/models/reserva.dart';

int i = 3;

class ReservaService {

  

  static Future<List<Reserva>> getReservas() async {
    return Reserva.reservas;

  }

  static Future<String> agregarReserva(Map<String, String> formValues ) async {

    Reserva.nuevasreservas.add(Reserva(
        idReserva: i,
        fechaCadena: formValues['fechaCadena'],//'2023-11-12T15:30:00Z',
        fecha: '2023-11-12T15:30:00Z',//formValues['fechaCadena'],//'2023-11-12T15:30:00Z'
        horaInicioCadena: '5:00 PM',
        horaFinCadena: '7:00 PM',
        idEmpleado: int.parse(formValues['idEmpleado']!),
        idCliente: 1,
        apellidoEmpleado: 'Lopez',
        nombreEmpleado: 'Juan',
        nombreCliente: 'Maria',
        apellidoCliente: 'Salgado',
        observacion: 'a',
        flagAsistio: '',
        fechaDesdeCadena: '2022-11-12T15:30:00Z',
        fechaHastaCadena: '2021-11-12T15:30:00Z'
    ));
    Reserva.reservas.addAll(Reserva.nuevasreservas);
    Reserva.nuevasreservas.clear();
    i++;

    return 'OK';

    

  }

  static Future<String> actualizarReserva(
      Map<String, String> formValues) async {

    int idReserva = int.parse(formValues['ID']!);
    final reserva = Reserva.reservas.where((f) => f.idReserva == idReserva).first;

    reserva.observacion = formValues['observacion'];
    reserva.flagAsistio = formValues['flagAsistio'];

    return 'OK';

  }

  static Future<String> cancelarReserva(int? reservas) async {

    for (int i=0; i<Reserva.reservas.length; i++) {
      if (reservas == Reserva.reservas[i].idReserva) {
        Reserva.reservas.removeAt(i);
      }
    }

    return 'OK';
  }

  static Future<List<Reserva>> getReservasByDateAndDoctor(
      Map<String, String> formValue) async {

    return Reserva.reservas;
    
  }
}
