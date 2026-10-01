import 'package:flutter/material.dart';

import '../models/producto.dart';
import '../widgets/producto_pedido.dart';

class MiPedidoScreen extends StatefulWidget {
  const MiPedidoScreen({super.key});

  @override
  State<MiPedidoScreen> createState() => _MiPedidoScreenState();
}

class _MiPedidoScreenState extends State<MiPedidoScreen> {
  late final List<Producto> _productos = [
    Producto(nombre: 'Café', precio: 10.00, imagen: 'assets/img/Coffe.jpg'),
    Producto(
      nombre: 'Sándwich',
      precio: 25.00,
      imagen: 'assets/img/sandwich.png',
    ),
    Producto(nombre: 'Jugo', precio: 12.00, imagen: 'assets/img/jugo.png'),
  ];

  double get _total => _productos.fold(0, (suma, p) => suma + p.subtotal);

  void _cambiarCantidad(Producto producto, int delta) {
    if (producto.cantidad + delta < 0) {
      return;
    }
    setState(() => producto.cantidad += delta);
  }

  void _vaciarPedido() {
    setState(() {
      for (final producto in _productos) {
        producto.cantidad = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: false,
        titleSpacing: 16,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: colorScheme.onPrimary.withValues(alpha: 0.15),
              child: Icon(
                Icons.local_cafe,
                color: colorScheme.onPrimary,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Cafetería',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    'Mi pedido',
                    style: TextStyle(
                      fontSize: 12.5,
                      letterSpacing: 2.4,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onPrimary.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Productos disponibles',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: _productos.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final producto = _productos[index];
                  return ProductoPedido(
                    producto: producto,
                    onIncrementar: () => _cambiarCantidad(producto, 1),
                    onDecrementar: () => _cambiarCantidad(producto, -1),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Q${_total.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.delete_outline),
                label: const Text('Vaciar pedido'),
                onPressed: _vaciarPedido,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
