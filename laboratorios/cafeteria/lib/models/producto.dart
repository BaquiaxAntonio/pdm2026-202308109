class Producto {
  final String nombre;
  final double precio;
  final String imagen;
  int cantidad;

  Producto({
    required this.nombre,
    required this.precio,
    required this.imagen,
    this.cantidad = 0,
  });

  double get subtotal => precio * cantidad;
}
