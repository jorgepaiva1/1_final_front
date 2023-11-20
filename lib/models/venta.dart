class Venta {
  final int? idVenta;
  final int? nroFactura;
  String? fecha;
  String? total;
  int? idProducto;
  int? cantidad;

  Venta({
      this.idVenta,
      this.nroFactura,
      this.fecha,
      this.total,
      this.idProducto,
      this.cantidad,
    }
  );

  static List<Venta> ventas = [
    Venta(
      idVenta: 1,
      nroFactura: 1,
      fecha: '18/11/2023',
      total: "12.500",
      idProducto: 1,
      cantidad: 5,
    ),
    Venta(
      idVenta: 2,
      nroFactura: 1,
      fecha: '18/11/2023',
      total: "8.000",
      idProducto: 2,
      cantidad: 2,
    ),
    Venta(
      idVenta: 3,
      nroFactura: 1,
      fecha: '19/11/2023',
      total: "127.500",
      idProducto: 1,
      cantidad: 51,
    ),
    Venta(
      idVenta: 4,
      nroFactura: 1,
      fecha: '19/11/2023',
      total: "64.000",
      idProducto: 2,
      cantidad: 16,
    )
  ];

  static List<Venta> nuevasVentas = [];

}
