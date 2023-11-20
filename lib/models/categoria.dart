class Categoria {
  final int? idCategoria;
  String? nombre;

  Categoria ({
  this.idCategoria,
  this.nombre,
  }
  );


  static List<Categoria> categorias = [
  Categoria(
  idCategoria: 1,
  nombre: 'Categoria 1',
  ),
    Categoria(
      idCategoria: 2,
      nombre: 'Categoria 2',
    )
  ];

  static List<Categoria> nuevasCategorias = [];
}