class Cliente {
  final int? id;
  String? nombre;
  String? apellido;
  String? telefono;
  String? email;
  String? ruc;
  String? cedula;

  Cliente({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.email,
    required this.ruc,
    required this.cedula,

  });

  static List<Cliente> clientes = [
    Cliente(
      id: 1,
      nombre: 'Juan',
      apellido: 'Pérez',
      telefono: '0971123456',
      email: 'Jpe@gmail.com',
      ruc: '123456789-1',
      cedula: '123456789',
    ),
    Cliente(
      id: 2,
      nombre: 'Maria',
      apellido: 'Garcia',
      telefono: '0981123456',
      email: 'Maga@gmail.com',
      ruc: '123456788-2',
      cedula: '123456788',
    ),
  ];

  static List<Cliente> nuevosClientes = [];
}