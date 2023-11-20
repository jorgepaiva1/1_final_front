class Producto {
  final int? id;
  String? codigo;
  String? nombreProducto;
  String? idCategoria;
  String? precioVenta;

  Producto({
    required this.id,
    required this.codigo,
    required this.nombreProducto,
    required this.idCategoria,
    required this.precioVenta,
  });

  static List<Producto> productos = [
    Producto(
      id: 1,
      codigo: '123',
      nombreProducto: 'Coca-Cola',
      idCategoria: '1',
      precioVenta: '7500'
    ),
    Producto(
      id: 2,
      codigo: '124',
      nombreProducto: 'pan',
      idCategoria: '2',
      precioVenta: '6400'
    ),
  ];

  static List<Producto> nuevosProductos = [];
}