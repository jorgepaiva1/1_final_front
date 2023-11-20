class Reserva {
  final int? idReserva;
  final String? fechaCadena;
  final String? fecha;
  final String? horaInicioCadena;
  final String? horaFinCadena;
  final int? idEmpleado;
  final String? nombreEmpleado;
  final String? apellidoEmpleado;
  final int? idCliente;
  final String? nombreCliente;
  final String? apellidoCliente;
  String? observacion;
  String? flagAsistio;
  final String? fechaDesdeCadena;
  final String? fechaHastaCadena;

   Reserva({
    required this.idReserva,
    required this.fechaCadena,
    required this.fecha,
    required this.horaInicioCadena,
    required this.horaFinCadena,
    required this.idEmpleado,
    required this.idCliente,
    required this.apellidoEmpleado,
    required this.nombreEmpleado,
    required this.nombreCliente,
    required this.apellidoCliente,
    required this.observacion,
    required this.flagAsistio,
    required this.fechaDesdeCadena,
    required this.fechaHastaCadena,
  });


  static List<Reserva> reservas = [
  Reserva(
  idReserva: 1,
  fechaCadena: '',
  fecha: DateTime(2023,11,10).toString(),
  horaInicioCadena: '10:00 AM',
  horaFinCadena: '11:00 AM',
  idEmpleado: 1,
  nombreEmpleado: 'Juan',
  apellidoEmpleado: 'Lopez',
  idCliente: 2,
  nombreCliente: 'Ester',
  apellidoCliente: 'Salgado',
  observacion: 'problema de ojo',
  flagAsistio: 'N',
  fechaDesdeCadena: '',
  fechaHastaCadena: '',
  ),
    Reserva(
      idReserva: 2,
      fechaCadena: '',
      fecha: DateTime(2023,11,11).toString(),
      horaInicioCadena: '2:00 PM',
      horaFinCadena: '3:00 PM',
      idEmpleado: 1,
      nombreEmpleado: 'Juan',
      apellidoEmpleado: 'Lopez',
      idCliente: 2,
      nombreCliente: 'Luis',
      apellidoCliente: 'Salgado',
      observacion: 'Dolor de cabeza',
      flagAsistio: 'S',
      fechaDesdeCadena: '',
      fechaHastaCadena: '',
    ),
  ];

  static List<Reserva> nuevasreservas = [];
}
